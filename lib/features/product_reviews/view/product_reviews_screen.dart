import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/features/product_reviews/widgets/user_review_card.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/products/ratings/rating_indicator.dart';
import '../widgets/overall_product_rating.dart';

class ProductReviewsScreen extends ConsumerWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const EshopAppBar(
        showBackArrow: true,
        title: Text('Reviews & Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              /// Overall Product Ratings
              const OverallProductRating(),
              
              const EshopRatingBarIndicator(rating: 4.5),
              
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: EshopSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),

        ),
      ),
    );
  }
}





