import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/brand/brand_card.dart';
import 'package:eshop/common/widgets/products/sortable/sortable_products.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';
class BrandProducts extends ConsumerWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('Yonex'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: EshopSizes.defaultSpace, left: EshopSizes.defaultSpace, right: EshopSizes.defaultSpace, bottom: EshopSizes.appBarHeight),
          child: Column(
            children: [
              BrandCard(showBorder: true, brandTitle: 'Yonex', brandImage: EshopImages.yonex, brandNoOfProd: '256 products'),
              SizedBox(height: EshopSizes.spaceBtwSections),

              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
