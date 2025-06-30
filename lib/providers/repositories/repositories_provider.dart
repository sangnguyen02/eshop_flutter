import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repos/auth_repo/auth_repository.dart';
import '../../repos/category_repo/category_repository.dart';
import '../services/services_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  return AuthRepository(httpClient: httpClient);
});


final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  return CategoryRepository(httpClient: httpClient);
});