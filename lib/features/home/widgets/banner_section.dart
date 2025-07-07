import 'package:eshop/features/home/widgets/home_banner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import  'package:flutter/material.dart';
import '../../../common/widgets/error_handler/error_handler.dart';
import '../../../providers/features/home/home_provider.dart';

class BannerSection extends ConsumerWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(homeViewModelProvider.select((state) => state.banners));
    final showRetry = ref.watch(homeViewModelProvider.select((state) => state.showBannerRetry));
    final vmNotifier = ref.read(homeViewModelProvider.notifier);

    return banners.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorHandler(
        height: 180,
        errorMessage: error.toString(),
        showRetry: showRetry,
        onRetryPressed: vmNotifier.reloadBanners,
      ),
      data: (banners) => HomeBanner(banners: banners),
    );
  }
}



