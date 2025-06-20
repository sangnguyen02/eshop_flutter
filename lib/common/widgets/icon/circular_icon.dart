import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = EshopSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,

  });
  final IconData icon;
  final double? width, height, size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : dark
                ? EshopColors.black.withOpacity(0.9)
                : EshopColors.white.withOpacity(0.9),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: size),
        ),
    );
  }
}
