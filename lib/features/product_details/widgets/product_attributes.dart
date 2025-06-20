import 'package:eshop/common/widgets/chips/choice_chip.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/common/widgets/texts/product_price.dart';
import 'package:eshop/common/widgets/texts/product_title.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected attributes pricing and description
        RoundedContainer(
          padding: const EdgeInsets.all(EshopSizes.md),
          backgroundColor: dark ? EshopColors.darkerGrey : EshopColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(title: 'Variation'),
                  const SizedBox(width: EshopSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitle(title: 'Price: ', smallSize: true),
                          /// Actual price
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),

                          const SizedBox(width: EshopSizes.spaceBtwItems),
                          /// Sale price
                          const ProductPrice(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitle(title: 'Stock: ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ProductTitle(
                title: 'This is the Description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),

            ],
          ),
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                const SectionHeading(title: 'Colors'),
                const SizedBox(height: EshopSizes.spaceBtwItems / 2),
              
                EshopChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                EshopChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                EshopChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {}),

              ],
            ),
          ],
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                const SectionHeading(title: 'Size'),
                const SizedBox(height: EshopSizes.spaceBtwItems / 2),
              
                EshopChoiceChip(text: 'S 3', selected: true, onSelected: (value) {}),
                EshopChoiceChip(text: 'M 4', selected: false, onSelected: (value) {}),
                EshopChoiceChip(text: 'L 5', selected: false, onSelected: (value) {})
              
              ],
            ),
          ],
        )
      ],
    );
  }
}
