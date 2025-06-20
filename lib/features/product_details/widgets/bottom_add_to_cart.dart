import 'package:eshop/common/widgets/icon/circular_icon.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/device/device_utility.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    double bottomNavbar = EshopDeviceUtils.getBottomNavigationBarHeight();

    return Padding(
      padding: EdgeInsets.only(bottom: bottomNavbar),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace, vertical: EshopSizes.defaultSpace / 2),
        decoration: BoxDecoration(
          color: dark ? EshopColors.darkerGrey : EshopColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(EshopSizes.cardRadiusLg),
            topRight: Radius.circular(EshopSizes.cardRadiusLg),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: EshopColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: EshopColors.white,
                ),
                const SizedBox(width: EshopSizes.spaceBtwItems),
                Text('2', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: EshopSizes.spaceBtwItems),
                const CircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: EshopColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: EshopColors.white,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(EshopSizes.md),
                backgroundColor: EshopColors.black,
                side: const BorderSide(color: EshopColors.black),
              ),
              child: const Text('Add to Cart'),

            )

          ],
        ),

      ),
    );
  }
}
