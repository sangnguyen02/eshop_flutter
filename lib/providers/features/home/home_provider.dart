import 'package:eshop/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/home/view_model/home_view_model.dart';
import '../../repositories/repositories_provider.dart';
import '../../services/services_provider.dart';


final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final authService = ref.watch(authServiceProvider);
  final router = ref.watch(appRouterProvider);
  // final productRepository = ref.watch(productRepositoryProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  // final brandRepository = ref.watch(brandRepositoryProvider);
  return HomeViewModel(authService, router, categoryRepository, ref);
});