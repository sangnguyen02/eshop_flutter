import 'package:eshop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/image/rounded_image.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../models/category/category_model.dart';
import '../../../providers/features/home/home_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/snackbar/snackbar_utils.dart';
import '../widgets/home_appbar.dart';
import '../../../common/widgets/image_text/vertical_image_text.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_categories.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vm = ref.watch(homeViewModelProvider);

    final List<CategoryModel> hardCodedCategories = [
      CategoryModel(
        id: 1,
        name: 'Yonex',
        slug: 'yonex',
        parentId: null,
        image: EshopImages.yonex,
      ),
      CategoryModel(
        id: 2,
        name: 'Lining',
        slug: 'lining',
        parentId: null,
        image: EshopImages.lining,
      ),
      CategoryModel(
        id: 3,
        name: 'Victor',
        slug: 'victor',
        parentId: null,
        image: EshopImages.victor,
      ),
      CategoryModel(
        id: 4,
        name: 'Mizuno',
        slug: 'mizuno',
        parentId: null,
        image: EshopImages.mizuno,
      ),
      CategoryModel(
        id: 5,
        name: 'Kawasaki',
        slug: 'kawasaki',
        parentId: null,
        image: EshopImages.kawasaki,
      ),
      CategoryModel(
        id: 6,
        name: 'Kamito',
        slug: 'kamito',
        parentId: null,
        image: EshopImages.kamito,
      ),
    ];


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
                        const SectionHeading(title: 'Popular categories', showActionButton: false, textColor: EshopColors.white,),

                        const SizedBox(height: EshopSizes.spaceBtwItems),

                        HomeCategories(hardCodedCategories: hardCodedCategories),

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














