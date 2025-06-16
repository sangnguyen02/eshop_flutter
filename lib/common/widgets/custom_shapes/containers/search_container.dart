import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace)
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: EshopDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(EshopSizes.md),
          decoration: BoxDecoration(
              color: showBackground ? dark ? EshopColors.dark : EshopColors.light : Colors.transparent,
              borderRadius: BorderRadius.circular(EshopSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: EshopColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: EshopColors.darkerGrey),
              const SizedBox(width: EshopSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
