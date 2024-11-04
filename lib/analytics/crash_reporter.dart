import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'crash_reporter.g.dart';

@riverpod
CrashReporter crashReporter(Ref ref) {
  return CrashReporter._();
}

class CrashReporter {
  CrashReporter._();

  void report(dynamic error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
      print(stackTrace);
    } else {
      Sentry.captureException(error, stackTrace: stackTrace);
    }
  }
}
