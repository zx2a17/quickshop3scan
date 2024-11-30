import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger.g.dart';

@riverpod
Logger logger(Ref ref) {
  return Logger._();
}

class Logger {
  Logger._();
  void log(String message) {
    // Todo: implement a proper logging framework
    print('QSLog: $message');
  }

  /// Capture a span of time for performance analysis
  void captureSpan(DateTime startTime, String message) {
    final completed = DateTime.now();
    print('QSLog: $message took ${completed.difference(startTime).inMilliseconds}ms');
  }
}
