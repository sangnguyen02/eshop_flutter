import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/providers/features/cart/cart_provider.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/device/device_utility.dart';
import '../widgets/product_cart_list.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(cartViewModelProvider);
    final bottomNavbar = EshopDeviceUtils.getBottomNavigationBarHeight();
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(EshopSizes.defaultSpace),
        child: ProductCartList(),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: EshopSizes.defaultSpace, right: EshopSizes.defaultSpace, bottom: bottomNavbar),
        child: ElevatedButton(
            onPressed: () => vm.router.push('/checkout'),
            child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}

