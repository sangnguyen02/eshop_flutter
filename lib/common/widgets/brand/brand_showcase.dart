import 'package:eshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brandTitle,
    required this.brandImage,
    required this.brandNoOfProd,

  });

  final List<String> images;
  final String brandImage, brandTitle, brandNoOfProd;

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      borderColor: EshopColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(EshopSizes.md),
      margin: const EdgeInsets.only(bottom: EshopSizes.spaceBtwItems),
      child: Column(
          children: [
            BrandCard(showBorder: false, brandImage: brandImage, brandTitle: brandTitle, brandNoOfProd: brandNoOfProd,),
            Row(
                children: images.map((image) => brandTopProductImageWidget(image, dark, context)).toList()
            )
          ]


      ),
    );
  }


  Widget brandTopProductImageWidget(String image, bool dark, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? EshopColors.darkerGrey : EshopColors.light,
        margin: EdgeInsets.only(right: EshopSizes.sm),
        padding: EdgeInsets.all(EshopSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}