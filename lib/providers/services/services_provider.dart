import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../router/router.dart';
import '../../utils/http/http_client.dart';
import '../../utils/local_storage/storage_utilities.dart';
import '../../services/auth_service/auth_service.dart';

final httpClientProvider = Provider<HttpClient>((ref) {
  return EshopHttpHelper();
});

final localStorageProvider = Provider<LocalStorage>((ref) {
  return EshopLocalStorage();
});

final authServiceProvider = Provider<AuthService>((ref) {
  final storage = ref.watch(localStorageProvider);
  return AuthService(storage);
});