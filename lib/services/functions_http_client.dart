import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../analytics/crash_reporter.dart';
import 'http_result.dart';
import 'user_token_service.dart';

part 'functions_http_client.g.dart';

@Riverpod(keepAlive: true)
FunctionsHttpClient functionsHttpClient(Ref ref) {
  throw FunctionsHttpClient(ref);
}

/// A client for making requests to HTTP-Triggered Firebase Functions in the Quickshop project.
/// This client adds necessary authentication headers to requests, and logs non-success responses:
/// - [HttpResultStatus.connectionError], [HttpResultStatus.retryableError] represent temporary
///   network errors that may be retried. These are logged to analytics for monitoring.
/// - [HttpResultStatus.unknownError] represents an unexpected error that is reported to Sentry.
class FunctionsHttpClient {
  FunctionsHttpClient(this.ref);

  final Ref ref;

  final host = const String.fromEnvironment('QUICKSHOP_FUNCTIONS_HOST');

  Future<HttpResult> post(String path, Map<String, dynamic> data) async {
    return _getResult(method: _Method.post, path: path, data: jsonEncode(data));
  }

  Future<HttpResult> _getResult(
      {required _Method method, required String path, dynamic data}) async {
    final uri = Uri.parse(host + path);
    final headers = await _buildHeaders();
    try {
      final response = await switch (method) {
        _Method.post => http.post(uri, body: data, headers: headers),
      };
      final result = HttpResult(
        uri: uri.toString(),
        response: response.body,
        statusCode: response.statusCode,
      );

      // Report unknown errors to Sentry for debugging
      if (result.resultStatus == HttpResultStatus.unknownError) {
        ref.read(crashReporterProvider).report(
              Exception('Unknown error from server'),
              StackTrace.current,
            );
      }
      // Log retryable errors to analytics
      else if (result.resultStatus == HttpResultStatus.retryableError) {
        final event = AnalyticsEvent.httpConnectionError(
          uri: uri.toString(),
          statusCode: result.statusCode,
          errorMessage: result.response,
        );
        ref.read(analyticsProvider).logEvent(event);
      }

      return result;
    } catch (e) {
      // Log connection failures to analytics
      final event = AnalyticsEvent.httpConnectionError(
        uri: uri.toString(),
        statusCode: connectionErrorStatusCode,
        errorMessage: e.toString(),
      );
      ref.read(analyticsProvider).logEvent(event);
      return HttpResult(
        uri: uri.toString(),
        response: e.toString(),
        statusCode: connectionErrorStatusCode,
      );
    }
  }

  Future<Map<String, String>> _buildHeaders() async {
    final headers = <String, String>{'Content-Type': 'application/json'};
    final token = await ref.read(userTokenServiceProvider).getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
}

enum _Method {
  post,
}
