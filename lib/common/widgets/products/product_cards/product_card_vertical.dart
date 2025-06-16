import 'package:eshop/common/styles/shadow_style.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/common/widgets/image/rounded_image.dart';
import 'package:eshop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:eshop/common/widgets/texts/product_price.dart';
import 'package:eshop/common/widgets/texts/product_title.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/enums.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../icon/circular_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(EshopSizes.productImageRadius),
          color: dark ? EshopColors.darkGrey : EshopColors.white
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist button, Discount Tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(EshopSizes.sm),
              backgroundColor: dark ? EshopColors.dark : EshopColors.light,
              child: Stack(
                children: [
                  const RoundedImage(imageUrl: EshopImages.yonex_astrox_77pro),

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

            const SizedBox(height: EshopSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: EshopSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(title: 'Yonex Astrox 77 Pro', smallSize: true),
                  SizedBox(height: EshopSizes.spaceBtwItems / 2),
                  BrandTitleWithVerifiedIcon(title: 'YONEX'),

                ],
              ),
            ),

            /// Add spacer to keep the height of each box same in case 1 or 2 lines of headings
            const Spacer(),

            /// Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: EshopSizes.sm),
                  child: ProductPrice(price: '200.0'),
                ),

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
    );
  }
}

