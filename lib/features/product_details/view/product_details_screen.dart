import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/features/product_details/widgets/product_attributes.dart';
import 'package:eshop/features/product_details/widgets/product_meta_data.dart';
import 'package:eshop/providers/features/product_details/product_details_provider.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../utils/constants/text_strings.dart';
import '../widgets/bottom_add_to_cart.dart';
import '../widgets/product_detail_image_silder.dart';
import '../widgets/rating_and_share.dart';


class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(productDetailsViewModelProvider);
    final bottomNavbar = EshopDeviceUtils.getBottomNavigationBarHeight();
    return Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: const Text(''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.heart5, color: Colors.red)
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottomNavbar),
        child: Column(
          children: [
            /// Product Image Slider
            const ProductImageSlider(),

            /// Details
            Padding(
              padding: EdgeInsets.only(right: EshopSizes.defaultSpace, left: EshopSizes.defaultSpace, bottom: bottomNavbar),
              child: Column(
                children: [
                  /// Rating & Share
                  const RatingAndShare(),
                  /// Price, Title, Stock and Brand
                  const ProductMetaData(),
                  /// Attributes
                  const ProductAttributes(),
                  const SizedBox(height: EshopSizes.spaceBtwSections),
                  /// Checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout')
                    ),
                  ),
                  const SizedBox(height: EshopSizes.spaceBtwSections),
                  /// Description

                  const SectionHeading(title: 'Description'),
                  const SizedBox(height: EshopSizes.spaceBtwItems),
                  const ReadMoreText(
                    EshopTexts.sampleDescription,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: EshopSizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews (199)'),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => vm.router.push('/product-reviews')),
                    ],
                  ),
                  const SizedBox(height: EshopSizes.spaceBtwSections)
                ],

              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: const BottomAddToCart(),
    );
  }
}



