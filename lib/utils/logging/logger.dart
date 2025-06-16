import 'logger_manager.dart';

class EshopLogger {
  static void info(String message) {
    LoggerManager.info(message);
  }

  static void error(String message) {
    LoggerManager.error(message);
  }

  static void debug(String message) {
    LoggerManager.debug(message);
  }

  static void warning(String message) {
    LoggerManager.warning(message);
  }
}