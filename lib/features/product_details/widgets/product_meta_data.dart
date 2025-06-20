import 'package:eshop/common/widgets/image/circular_image.dart';
import 'package:eshop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:eshop/common/widgets/texts/product_price.dart';
import 'package:eshop/common/widgets/texts/product_title.dart';
import 'package:eshop/utils/constants/enums.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & sale price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: EshopSizes.sm,
              backgroundColor: EshopColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: EshopSizes.sm, vertical: EshopSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EshopColors.black)),
            ),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            const ProductPrice(price: '175', isLarge: true),


          ],
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitle(title: 'Yonex Astrox 77 Pro'),
        const SizedBox(height: EshopSizes.spaceBtwItems / 1.5),

        /// Stock status
        Row(
          children: [
            const ProductTitle(title: 'Status'),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems / 1.5),

        /// Brand
        const Row(
            children: [
              CircularImage(
                  imageUrl: EshopImages.yonex,
                  width: 32,
                  height: 32
              ),
              BrandTitleWithVerifiedIcon(title: 'Yonex', brandTextSize: TextSizes.medium)
            ]
        )

      ],
    );
  }
}
