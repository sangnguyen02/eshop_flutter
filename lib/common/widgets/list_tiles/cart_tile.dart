import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../image/rounded_image.dart';
import '../texts/brand_title_with_verified_icon.dart';
import '../texts/product_title.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Image
        RoundedImage(
          image: EshopImages.yonex_astrox_77pro,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(EshopSizes.sm),
          backgroundColor: dark ? EshopColors.darkerGrey : EshopColors.light,
        ),
        const SizedBox(width: EshopSizes.spaceBtwItems),
        /// Title, price, size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Yonex'),
              const Flexible(child: ProductTitle(title: 'Yonex Astrox 77Pro', maxLines: 1)),

              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'S 3', style: Theme.of(context).textTheme.bodyLarge)
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}