import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:eshop/features/home/widgets/banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../providers/features/home/home_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../widgets/category_section.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vmNotifier = ref.read(homeViewModelProvider.notifier);
    final isLoading = ref.watch(homeViewModelProvider.select(
        (state) => state.categories.isLoading && state.banners.isLoading,
    ));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const PrimaryHeaderContainer(
                  child: Column(
                    children: [
                      HomeAppbar(),

                      SizedBox(height: EshopSizes.defaultSpace),

                      SearchContainer(text: 'Search in store'),

                      SizedBox(height: EshopSizes.defaultSpace),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: EshopSizes.defaultSpace),
                        child: Column(
                          children: [
                            SectionHeading(
                              title: 'Popular categories',
                              showActionButton: false,
                              textColor: EshopColors.white,
                            ),

                            SizedBox(height: EshopSizes.spaceBtwItems),

                            CategorySection(),

                          ],
                        ),
                      ),
                      SizedBox(height: EshopSizes.spaceBtwItems)
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.only(top: EshopSizes.xs, right: EshopSizes.defaultSpace, left: EshopSizes.defaultSpace, bottom: EshopSizes.defaultSpace),
                    child: Column(
                      children: [
                        const BannerSection(),

                        const SizedBox(height: EshopSizes.spaceBtwSections),

                        SectionHeading(
                          title: 'Popular Products',
                          showActionButton: true,
                          onPressed: () => vmNotifier.router.push('/all-products'),
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

          /// Global Loading
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ]
      ),
    );
  }
}