import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.padding = EshopSizes.sm,
    this.isNetworkImage = false,
    this.showBorder = false,
    this.borderColor = EshopColors.borderPrimary
  });


  final BoxFit? fit;
  final String imageUrl;
  final Color? overlayColor;
  final Color borderColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool isNetworkImage;
  final bool showBorder;


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? EshopColors.black : EshopColors.white),
        borderRadius: BorderRadius.circular(100),
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}