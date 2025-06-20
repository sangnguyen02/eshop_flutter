import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import 'brand_title.dart';


class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.iconColor = EshopColors.primaryColor,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });


  final String title;
  final Color? textColor, iconColor;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BrandTitle(
              title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              brandTextSize: brandTextSize,
            )
        ),
        const SizedBox(width: EshopSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: EshopSizes.iconXs),
      ],
    );
  }
}
