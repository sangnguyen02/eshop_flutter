// providers/cart_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/product/product_model.dart';

final cartProvider = StateProvider<List<ProductModel>>((ref) => []);

final cartCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).length;
});