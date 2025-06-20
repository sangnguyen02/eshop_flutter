import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/text_strings.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);

    return RoundedContainer(
      padding: const EdgeInsets.all(EshopSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? EshopColors.primaryColor.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
            ? EshopColors.darkerGrey
            : EshopColors.grey,
      margin: const EdgeInsets.only(bottom: EshopSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? EshopColors.light
                      : EshopColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                EshopTexts.sampleUserName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: EshopSizes.sm / 2),
              const Text(EshopTexts.sampleAddressPhone, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: EshopSizes.sm / 2),
              const Text(EshopTexts.sampleAddress, softWrap: true),

            ],
          )
        ],
      ),
    );
  }
}
