import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? EshopColors.dark : EshopColors.white,
      padding: const EdgeInsets.only(top: EshopSizes.sm, bottom: EshopSizes.sm, right: EshopSizes.sm, left: EshopSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none

              ),
            ),
          ),

          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? EshopColors.white.withOpacity(0.5) : EshopColors.dark.withOpacity(0.5),
                  backgroundColor: EshopColors.grey.withOpacity(0.2),
                  side: BorderSide(color: EshopColors.grey.withOpacity(0.1)),
                ),
                child: const Text('Apply')
            ),
          )
        ],
      ),
    );
  }
}
