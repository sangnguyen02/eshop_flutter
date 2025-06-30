import 'package:eshop/utils/local_storage/storage_utilities.dart';
import 'package:eshop/utils/logging/logger_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';
import 'firebase_options.dart';

void main() async {

  /// To do: Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  /// Init Local Storage
  await EshopLocalStorage.initialize();
  /// Init Payment method

  /// Await native splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Initialize Supabase
  // await Supabase.initialize(
  //   url: 'https://mrwurbxhhzhdlzgxwwdl.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1yd3VyYnhoaHpoZGx6Z3h3d2RsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1NzcyMTMsImV4cCI6MjA2NjE1MzIxM30.dp5hnLCNWLdWuRhtZU5yazkjgMXrxc0QYUnfl812zUg',
  // );
  /// Initialize Authentication




  if (kDebugMode) {
    LoggerManager.enableLogging();
  } else {
    LoggerManager.disableLogging();
  }


  runApp(const ProviderScope(child: App()));
}
