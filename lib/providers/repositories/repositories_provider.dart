import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repos/auth_repo/auth_repository.dart';
import '../services/services_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  return AuthRepository(httpClient: httpClient);
});

// final productRepositoryProvider = Provider<ProductRepository>((ref) {
//   final httpClient = ref.watch(httpClientProvider);
//   final authService = ref.watch(authServiceProvider);
//   return ProductRepository(httpClient: httpClient, authService: authService);
// });
//
// final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
//   final httpClient = ref.watch(httpClientProvider);
//   final authService = ref.watch(authServiceProvider);
//   return CategoryRepository(httpClient: httpClient, authService: authService);
// });
//
// final brandRepositoryProvider = Provider<BrandRepository>((ref) {
//   final httpClient = ref.watch(httpClientProvider);
//   final authService = ref.watch(authServiceProvider);
//   return BrandRepository(httpClient: httpClient, authService: authService);
// });