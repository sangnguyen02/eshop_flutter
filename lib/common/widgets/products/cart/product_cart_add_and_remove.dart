import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class ProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: EshopSizes.md,
          color: dark ? EshopColors.white : EshopColors.black,
          backgroundColor: dark ? EshopColors.darkerGrey : EshopColors.light,
        ),
        const SizedBox(width: EshopSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: EshopSizes.spaceBtwItems),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: EshopSizes.md,
          color: EshopColors.white,
          backgroundColor: EshopColors.primaryColor,
        ),
      ],
    );
  }
}