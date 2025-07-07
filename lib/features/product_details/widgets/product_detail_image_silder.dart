import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../common/widgets/image/rounded_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);

    return CustomCurvedEdgesWidget(
      child: Container(
        color: dark ? EshopColors.darkerGrey : EshopColors.light,
        child: Stack(
          children: [
            /// Thumbnail Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(EshopSizes.productImageRadius),
                child: Center(
                  child: Image(
                    image: AssetImage(EshopImages.yonex_astrox_77pro),
                  ),
                ),
              ),
            ),

            Positioned(
              right: 0,
              bottom: 30,
              left: EshopSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(width: EshopSizes.spaceBtwItems),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (_, index) => RoundedImage(
                        width: 80,
                        backgroundColor: dark ? EshopColors.dark : EshopColors.white,
                        border: Border.all(color: EshopColors.primaryColor),
                        padding: const EdgeInsets.all(EshopSizes.sm),
                        image: EshopImages.yonex_astrox_77pro
                    )
                ),
              ),
            ),


          ],
        ),

      ),
    );
  }
}