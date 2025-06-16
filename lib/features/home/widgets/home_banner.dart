import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../common/widgets/image/rounded_image.dart';
import '../../../providers/features/home/home_provider.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class HomeBanner extends ConsumerWidget {
  const HomeBanner({
    super.key,
    required this.banners
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(homeViewModelProvider);
    final PageController pageController = PageController(initialPage: vm.carouselCurrentIndex);

    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => RoundedImage(borderRadius: EshopSizes.borderRadiusLg, imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, _) {
              ref.read(homeViewModelProvider.notifier).updatePageIndicator(index);
            },
          ),
        ),
        const SizedBox(height: EshopSizes.spaceBtwItems),
        SmoothPageIndicator(
          controller: pageController,
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

