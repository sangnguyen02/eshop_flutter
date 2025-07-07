import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/image/rounded_image.dart';
import '../../../models/banner/banner_model.dart';
import '../../../providers/features/home/home_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class HomeBanner extends ConsumerWidget {
  const HomeBanner({
    super.key,
    required this.banners
  });

  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmNotifier = ref.watch(homeViewModelProvider.notifier);
    final currentIndex = ref.watch(homeViewModelProvider.select((state) => state.carouselCurrentIndex));

    return Column(
      children: [
        CarouselSlider(
          items: banners.map((banner) => RoundedImage(isNetworkImage: true, borderRadius: EshopSizes.borderRadiusLg, image: banner.image)).toList(),
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            // autoPlay: true,
            // autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, _) {
              vmNotifier.updatePageIndicator(index);
            },
            initialPage: currentIndex,
          ),
        ),
        const SizedBox(height: EshopSizes.spaceBtwItems),
        SmoothPageIndicator(
          controller: PageController(initialPage: currentIndex),
          count: 3,
          effect: const WormEffect(
            dotHeight: 4,
            dotWidth: 20,
            spacing: 10,
            activeDotColor: EshopColors.primaryColor,
            dotColor: EshopColors.grey,
          ),
        ),
      ],
    );
  }
}

