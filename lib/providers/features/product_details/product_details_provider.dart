import 'package:eshop/features/product_details/view_model/product_details_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../router/router.dart';

final productDetailsViewModelProvider = ChangeNotifierProvider<ProductDetailsViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  return ProductDetailsViewModel(router, ref);
});
