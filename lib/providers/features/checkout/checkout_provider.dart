import 'package:eshop/features/checkout/view_model/checkout_view_model.dart';
import 'package:eshop/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutViewModelProvider = ChangeNotifierProvider<CheckoutViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  return CheckoutViewModel(router, ref);
});