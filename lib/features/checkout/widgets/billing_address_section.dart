import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_functions.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {},
        ),
        Text('Rick NGX', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: EshopSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: EshopColors.grey, size: 16),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            Text(EshopTexts.sampleAddressPhone, style: Theme.of(context).textTheme.bodyMedium),

          ],
        ),
        const SizedBox(height: EshopSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: EshopColors.grey, size: 16),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            Expanded(
                child: Text(EshopTexts.sampleAddress, style: Theme.of(context).textTheme.bodyMedium, softWrap: true)
            ),
          ],
        ),
        const SizedBox(height: EshopSizes.spaceBtwItems / 2),
      ],

    );
  }
}
