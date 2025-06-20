import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/products/sortable/sortable_products.dart';

class AllProductsScreen extends ConsumerWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: EshopSizes.defaultSpace, left: EshopSizes.defaultSpace, right: EshopSizes.defaultSpace, bottom: EshopSizes.appBarHeight),
          child: SortableProducts(),
        ),
      ),
    );
  }
}

