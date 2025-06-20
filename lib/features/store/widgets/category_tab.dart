import 'package:eshop/common/widgets/brand/brand_showcase.dart';
import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowcase(
                brandImage: EshopImages.yonex,
                brandTitle: 'Yonex',
                brandNoOfProd: '(3 products)',
                images: [EshopImages.yonex_astrox_77pro, EshopImages.yonex_65z3, EshopImages.yonex_rm2832_navy_peony]
              ),
              const SizedBox(height: EshopSizes.spaceBtwItems),
              const BrandShowcase(
                  brandImage: EshopImages.lining,
                  brandTitle: 'Lining',
                  brandNoOfProd: '(3 products)',
                  images: [EshopImages.lining_axforce90, EshopImages.lining_ayzu015_2, EshopImages.lining_aayq079_4]
              ),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              SectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical()
              ),
              const SizedBox(height: EshopSizes.spaceBtwSections),

            ],
          ) ,
        ),
      ],
    );
  }
}
