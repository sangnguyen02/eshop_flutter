import 'package:eshop/utils/local_storage/storage_utilities.dart';
import 'package:eshop/utils/logging/logger_manager.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EshopLocalStorage.initialize();

  if (kDebugMode) {
    LoggerManager.enableLogging();
  } else {
    LoggerManager.disableLogging();
  }


  runApp(const ProviderScope(child: App()));
}
