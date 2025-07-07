import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/image/rounded_image.dart';
import 'package:eshop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const EshopAppBar(
        showBackArrow: true,
        title: Text('Clothes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImage(width: double.infinity, image: EshopImages.banner2, applyImageRadius: true),
              const SizedBox(height: EshopSizes.spaceBtwSections),

              /// Sub-categories
              Column(
                children: [
                  /// Heading
                  SectionHeading(title: 'Shirts', showActionButton: true, onPressed: () {}),
                  const SizedBox(height: EshopSizes.spaceBtwItems / 2),


                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(width: EshopSizes.spaceBtwItems),
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const ProductCardHorizontal()
                    ),
                  )


                ],
              )

            ],

          ),
        ),
      ),
    );
  }
}
