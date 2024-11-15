import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_result.freezed.dart';

@freezed
class HttpResult with _$HttpResult {
  const HttpResult._();

  const factory HttpResult({
    required String uri,
    required String response,
    required int statusCode,
  }) = _HttpResult;

  HttpResultStatus get resultStatus {
    if (statusCode == connectionErrorStatusCode) {
      return HttpResultStatus.connectionError;
    }
    if (statusCode >= 200 && statusCode < 300) {
      return HttpResultStatus.success;
    }
    if (const {420, 502, 503, 504}.contains(statusCode)) {
      return HttpResultStatus.retryableError;
    }
    return HttpResultStatus.unknownError;
  }
}

const int connectionErrorStatusCode = -1;

enum HttpResultStatus {
  /// A success status code was received from the server
  /// Http Status Codes 200-299
  success,

  /// The request failed because the target server could not be reached. A retry may succeed once
  /// the client device regains network connectivity.
  /// Http Status Code -1
  connectionError,

  /// The request failed, with a status code response indicating a future request may succeed, e.g.
  /// due to rate limiting, server maintenance, or traffic overload.
  /// Http Status Codes 429, 502, 503, 504
  retryableError,

  /// The request failed with a status code that does not indicate a retry would succeed - most
  /// likely due to either a malformed client request or a server-side error. Either way, the error
  /// should be reported and investigated for bug fixes. A retry is unlikely to succeed.
  unknownError,
}
