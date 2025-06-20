import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort)
            ),
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
                .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {

            }
        ),

        const SizedBox(height: EshopSizes.spaceBtwSections),

        GridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const ProductCardVertical()
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems)

      ],
    );
  }
}
