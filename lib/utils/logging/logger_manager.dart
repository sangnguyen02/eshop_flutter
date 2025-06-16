// lib/utils/logging/logger_manager.dart
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:logger/logger.dart';

class LoggerManager {
  static bool isLoggingEnabled = kDebugMode;

  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void enableLogging() {
    isLoggingEnabled = true;
    _logger.i('Logging enabled');
  }

  static void disableLogging() {
    isLoggingEnabled = false;
    _logger.i('Logging disabled');
  }

  static void info(String message) {
    if (isLoggingEnabled) {
      _logger.i(message);
    }
  }

  static void error(String message) {
    if (isLoggingEnabled) {
      _logger.e(message);
    }
  }

  static void debug(String message) {
    if (isLoggingEnabled) {
      _logger.d(message);
    }
  }

  static void warning(String message) {
    if (isLoggingEnabled) {
      _logger.w(message);
    }
  }
}