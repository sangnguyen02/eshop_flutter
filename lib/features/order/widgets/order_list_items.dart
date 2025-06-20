import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: EshopSizes.spaceBtwItems),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(EshopSizes.md),
        backgroundColor: dark ? EshopColors.dark : EshopColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: EshopSizes.spaceBtwItems / 2),
      
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: EshopColors.primaryColor, fontWeightDelta: 1)),
                      Text('19 Jun, 2025', style: Theme.of(context).textTheme.headlineSmall),
      
      
                    ],
                  ),
                ),
                
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: EshopSizes.iconSm))
              ],
            ),
      
            const SizedBox(height: EshopSizes.spaceBtwItems),
      
            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: EshopSizes.spaceBtwItems / 2),
      
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('#A0123', style: Theme.of(context).textTheme.titleMedium),
      
      
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: EshopSizes.spaceBtwItems / 2),
      
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('20 Jun, 2025', style: Theme.of(context).textTheme.titleMedium),
      
      
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      
      ),
    );
  }
}
