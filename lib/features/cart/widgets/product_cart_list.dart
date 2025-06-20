import 'package:flutter/material.dart';

import '../../../common/widgets/list_tiles/cart_tile.dart';
import '../../../common/widgets/products/cart/product_cart_add_and_remove.dart';
import '../../../common/widgets/texts/product_price.dart';
import '../../../utils/constants/sizes.dart';

class ProductCartList extends StatelessWidget {
  const ProductCartList({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: EshopSizes.spaceBtwSections),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
          children: [
            const CartTile(),

            if (showAddRemoveButton) const SizedBox(height: EshopSizes.spaceBtwItems),

            if (showAddRemoveButton)
              const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Extra space
                    SizedBox(width: 70),
                    /// Add and remove quantity
                    ProductQuantityWithAddAndRemoveButton(),
                  ],
                ),
                /// Price
                ProductPrice(price: '256')
              ],
            )
          ],
        )
    );
  }
}




