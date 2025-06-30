import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../models/category/category_model.dart';
import '../../../providers/features/home/home_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_categories.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vm = ref.watch(homeViewModelProvider);
    final categories = vm.categories;

    // final List<CategoryModel> hardCodedCategories = [
    //   CategoryModel(
    //     id: 1,
    //     name: 'Racket',
    //     slug: 'racket',
    //     parentId: null,
    //     image: EshopImages.racket,
    //   ),
    //   CategoryModel(
    //     id: 2,
    //     name: 'Clothes',
    //     slug: 'clothes',
    //     parentId: null,
    //     image: EshopImages.clothes,
    //   ),
    //   CategoryModel(
    //     id: 3,
    //     name: 'Shoes',
    //     slug: 'shoes',
    //     parentId: null,
    //     image: EshopImages.shoes,
    //   ),
    //   CategoryModel(
    //     id: 4,
    //     name: 'Bag',
    //     slug: 'bag',
    //     parentId: null,
    //     image: EshopImages.bag,
    //   ),
    //   CategoryModel(
    //     id: 5,
    //     name: 'Accessories',
    //     slug: 'accessories',
    //     parentId: null,
    //     image: EshopImages.accessories,
    //   ),
    // ];


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppbar(),

                  const SizedBox(height: EshopSizes.defaultSpace),

                  const SearchContainer(text: 'Search in store'),

                  const SizedBox(height: EshopSizes.defaultSpace),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace),
                    child: Column(
                      children: [
                        const SectionHeading(
                          title: 'Popular categories', 
                          showActionButton: false,
                          textColor: EshopColors.white,
                        ),

                        const SizedBox(height: EshopSizes.spaceBtwItems),

                        HomeCategories(categories: categories),

                      ],
                    ),
                  ),
                  const SizedBox(height: EshopSizes.spaceBtwItems)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(EshopSizes.defaultSpace),
              child: Column(
                children: [
                  const HomeBanner(banners: [EshopImages.banner1, EshopImages.banner2, EshopImages.banner3]),

                  const SizedBox(height: EshopSizes.spaceBtwSections),

                  SectionHeading(
                    title: 'Popular Products',
                    showActionButton: true,
                    onPressed: () => vm.router.push('/all-products'),
                  ),

                  const SizedBox(height: EshopSizes.spaceBtwItems),

                  GridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const ProductCardVertical()
                  ),

                ],
              )



            ),


          ],
        ),
      ),
    );
  }
}














