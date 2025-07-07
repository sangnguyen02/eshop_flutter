import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../image/circular_image.dart';
import '../texts/brand_title_with_verified_icon.dart';



class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    this.padding = const EdgeInsets.all(EshopSizes.sm),
    this.backgroundColor = Colors.transparent,
    required this.brandTitle,
    required this.brandImage,
    required this.brandNoOfProd,
    this.isNetworkImage = false,
  });

  final bool showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final String brandImage, brandTitle, brandNoOfProd;
  final bool isNetworkImage;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: padding,
        showBorder: showBorder,
        backgroundColor: backgroundColor,
        child: Row(
          children: [
            Flexible(
              child: CircularImage(
                isNetworkImage: isNetworkImage,
                imageUrl: brandImage,
                backgroundColor: backgroundColor,
                showBorder: false,
              ),
            ),

            const SizedBox(width: EshopSizes.spaceBtwItems / 2),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(title: brandTitle, brandTextSize: TextSizes.large),

                  Text(
                    brandNoOfProd,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}