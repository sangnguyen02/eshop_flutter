import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/banner/banner_model.dart';
import '../../../models/category/category_model.dart';

class HomeState {
  final AsyncValue<List<CategoryModel>> categories;
  final AsyncValue<List<BannerModel>> banners;
  final int carouselCurrentIndex;
  final bool showCategoryRetry;
  final bool showBannerRetry;

  HomeState({
    this.categories = const AsyncValue.loading(),
    this.banners = const AsyncValue.loading(),
    this.carouselCurrentIndex = 0,
    this.showCategoryRetry = false,
    this.showBannerRetry = false,
  });

  HomeState copyWith({
    AsyncValue<List<CategoryModel>>? categories,
    AsyncValue<List<BannerModel>>? banners,
    int? carouselCurrentIndex,
    bool? showCategoryRetry,
    bool? showBannerRetry,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      banners: banners ?? this.banners,
      carouselCurrentIndex: carouselCurrentIndex ?? this.carouselCurrentIndex,
      showCategoryRetry: showCategoryRetry ?? this.showCategoryRetry,
      showBannerRetry: showBannerRetry ?? this.showBannerRetry,
    );
  }
}