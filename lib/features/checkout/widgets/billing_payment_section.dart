import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {},
        ),
        const SizedBox(height: EshopSizes.spaceBtwItems / 2),

        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? EshopColors.light : EshopColors.white,
              padding: const EdgeInsets.all(EshopSizes.sm),
              child: const Image(image: AssetImage(EshopImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: EshopSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],

    );
  }
}
