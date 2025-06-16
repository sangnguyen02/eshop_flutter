import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/icon/circular_icon.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/product_cards/product_card_vertical.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: EshopAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => context.pushReplacement('/home'))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical()
              ),
            ]


          ),
        ),
      ),
    );
  }
}