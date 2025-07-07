import 'package:eshop/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/home/model/home_state.dart';
import '../../../features/home/view_model/home_view_model.dart';
import '../../repositories/repositories_provider.dart';
import '../../services/services_provider.dart';


final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  final bannerRepository = ref.watch(bannerRepositoryProvider);
  final router = ref.watch(appRouterProvider);
  // final productRepository = ref.watch(productRepositoryProvider);
  // final brandRepository = ref.watch(brandRepositoryProvider);
  return HomeViewModel(authService, categoryRepository, bannerRepository, router, ref);
});