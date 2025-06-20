import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/providers/features/brands/brands_provider.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/brand/brand_card.dart';

class AllBrandsScreen extends ConsumerWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(brandsViewModelProvider);
    return Scaffold(
      appBar: const EshopAppBar(
        showBackArrow: true,
        title: Text('Brand'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeading(title: 'Brands'),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              /// Brands
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => BrandCard(
                    showBorder: true,
                    brandTitle: 'Yonex',
                    brandImage: EshopImages.yonex,
                    brandNoOfProd: '256 products',
                  onTap: () => vm.router.push('/brand-products'),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
