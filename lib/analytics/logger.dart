import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger.g.dart';

@riverpod
Logger logger(Ref ref) {
  return Logger();
}

class Logger {
  void log(String message) {
    // Todo: implement a proper logging framework
    print('QuickShop: $message');
  }
}
