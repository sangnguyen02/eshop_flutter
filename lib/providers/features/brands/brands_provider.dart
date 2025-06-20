import 'package:eshop/features/brands/view_model/brands_view_model.dart';
import 'package:eshop/features/store/view_model/store_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../router/router.dart';

final brandsViewModelProvider = ChangeNotifierProvider<BrandsViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  return BrandsViewModel(router, ref);
});