import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/constants/text_strings.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/products/ratings/rating_indicator.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(EshopImages.user)),
                const SizedBox(width: EshopSizes.spaceBtwItems),
                Text('Rick NGX', style: Theme.of(context).textTheme.titleLarge),

              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert)
            )
          ],
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const EshopRatingBarIndicator(rating: 4),
            const SizedBox(width: EshopSizes.spaceBtwItems),
            Text('19 Jun, 2025', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems),

        const ReadMoreText(
          EshopTexts.sampleReview,
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EshopColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,  color: EshopColors.primaryColor),
        ),

        const SizedBox(height: EshopSizes.spaceBtwItems),

        /// Reply
        RoundedContainer(
          backgroundColor: dark ? EshopColors.darkerGrey : EshopColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(EshopSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('E-Shop', style: Theme.of(context).textTheme.titleMedium),
                    Text('19 Jun, 2025', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),

                const SizedBox(height: EshopSizes.spaceBtwItems),

                const ReadMoreText(
                  EshopTexts.sampleReview,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: EshopColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,  color: EshopColors.primaryColor),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: EshopSizes.spaceBtwSections)
      ],
    );
  }
}
