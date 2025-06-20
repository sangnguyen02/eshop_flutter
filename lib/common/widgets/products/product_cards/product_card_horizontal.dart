import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icon/circular_icon.dart';
import '../../image/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_price.dart';
import '../../texts/product_title.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => context.push('/product-detail'),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            // boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(EshopSizes.productImageRadius),
            color: dark ? EshopColors.darkGrey : EshopColors.lightContainer
        ),
        child: Row(
          children: [
            /// Thumbnail, Wishlist button, Discount Tag
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(EshopSizes.sm),
              backgroundColor: dark ? EshopColors.dark : EshopColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: RoundedImage(
                      imageUrl: EshopImages.yonex_astrox_77pro,
                      applyImageRadius: true
                    )
                  ),

                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: EshopSizes.sm,
                      backgroundColor: EshopColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: EshopSizes.sm, vertical: EshopSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: EshopColors.black)),
                    ),
                  ),

                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CircularIcon(icon: Iconsax.heart5, color: Colors.red)
                  ),

                ],
              ),
            ),

            /// Details
            SizedBox(
               width: 172,
               child: Padding(
                 padding: const EdgeInsets.only(top: EshopSizes.sm, left: EshopSizes.sm),
                 child: Column(
                   children: [
                     const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         ProductTitle(title: 'Yonex Astrox 77 Pro', smallSize: true),
                         SizedBox(height: EshopSizes.spaceBtwItems / 2),
                         BrandTitleWithVerifiedIcon(title: 'YONEX'),
                       ],
                     ),

                     const Spacer(),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const Flexible(child: ProductPrice(price: '256.0')),

                         Container(
                           decoration: const BoxDecoration(
                               color: EshopColors.dark,
                               borderRadius: BorderRadius.only(
                                   topLeft: Radius.circular(EshopSizes.cardRadiusMd),
                                   bottomRight: Radius.circular(EshopSizes.productImageRadius)
                               )
                           ),
                           child: const SizedBox(
                               width: EshopSizes.iconLg * 1.2,
                               height: EshopSizes.iconLg * 1.2,
                               child: Center(child: Icon(Iconsax.add, color: EshopColors.white))
                           ),
                         )
                       ],
                     )
                   ],
                             ),
               ),
             ),
          ],
        ),


      ),
    );
  }
}
