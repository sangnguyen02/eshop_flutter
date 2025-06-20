import 'package:eshop/features/cart/view_model/cart_view_model.dart';
import 'package:eshop/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product/product_model.dart';

final cartProvider = StateProvider<List<ProductModel>>((ref) => []);

final cartCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).length;
});

final cartViewModelProvider = ChangeNotifierProvider<CartViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  return CartViewModel(router, ref);
});