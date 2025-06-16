import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/appbar/tabbar.dart';
import 'package:eshop/common/widgets/cart_counter_icon.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:eshop/common/widgets/layouts/grid_layout.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/features/store/widgets/category_tab.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/widgets/brand/brand_card.dart';


class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dark = EshopHelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: EshopAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CartCounterIcon(iconColor: dark ? EshopColors.white : EshopColors.black, onPressed: () {})
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? EshopColors.black : EshopColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(EshopSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: EshopSizes.spaceBtwItems),

                      const SearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),

                      const SizedBox(height: EshopSizes.spaceBtwSections),

                      SectionHeading(
                        title: 'Feature Brands',
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: EshopSizes.spaceBtwItems / 1.5),

                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const BrandCard(showBorder: false, brandTitle: 'Yonex', brandImage: EshopImages.yonex, brandNoOfProd: '(3 products)',);
                        }
                      )




                    ],
                  ),
                ),

                bottom: const EshopTabbar(
                  tabs:[
                    Tab(child: Text('Rackets'),),
                    Tab(child: Text('Shirts'),),
                    Tab(child: Text('Shorts'),),
                    Tab(child: Text('Bags'),),
                    Tab(child: Text('Accessories'),),
                  ],
                )

              ),
            ];
          },
          body: TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}





