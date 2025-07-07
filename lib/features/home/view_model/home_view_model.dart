import 'dart:async';
import 'package:eshop/repos/banner_repo/banner_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../repos/category_repo/category_repository.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../utils/logging/logger.dart';
import '../model/home_state.dart';


class HomeViewModel extends StateNotifier<HomeState> {
  final AuthService _authService;
  final CategoryRepository _categoryRepository;
  final BannerRepository _bannerRepository;
  final GoRouter _router;
  final Ref _ref;
  Timer? _debounceTimer;

  HomeViewModel(this._authService, this._categoryRepository, this._bannerRepository, this._router, this._ref)
      : super(HomeState()) {
    loadData();
  }

  GoRouter get router => _router;


  void updatePageIndicator(int index) {
    state = state.copyWith(carouselCurrentIndex: index);
  }

  Future<void> loadData() async {
    state = state.copyWith(
      categories: const AsyncValue.loading(),
      banners: const AsyncValue.loading(),
      showCategoryRetry: false,
      showBannerRetry: false,
    );
    try {
      final token = await _authService.getToken();
      if (token == null) {
        EshopLogger.error('HomeViewModel: No token found');
        state = state.copyWith(
          categories: AsyncValue.error('No token found. Please sign in.', StackTrace.current),
          banners: AsyncValue.error('No token found. Please sign in.', StackTrace.current),
        );
        // _router.push('/signin');
        return;
      }

      await Future.wait([
        loadCategories(token),
        loadBanners(token),
      ]);

    } catch (e) {
      EshopLogger.error('HomeViewModel: Unexpected error in loadData: $e');
    }
  }


  Future<void> loadCategories(String token) async {
    state = state.copyWith(categories: const AsyncValue.loading());
    try {
      final categoriesResult = await _categoryRepository.getAll(token);
      state = categoriesResult.fold(
        (failure) =>
        state.copyWith(
          categories: AsyncValue.error(failure.message, StackTrace.current),
          showCategoryRetry: true,
        ),
        (categories) =>
        state.copyWith(
          categories: AsyncValue.data(categories),
        ),
      );
    } catch (e) {
      state = state.copyWith(
        categories: AsyncValue.error('Failed to load categories: $e', StackTrace.current),
        showCategoryRetry: true,
      );
      EshopLogger.error('HomeViewModel: Failed to load categories: $e');
    }
  }

  Future<void> loadBanners(String token) async {
    state = state.copyWith(banners: const AsyncValue.loading());
    try {
      final bannerResult = await _bannerRepository.getAll(token);
      state = bannerResult.fold(
        (failure) =>
        state.copyWith(
          banners: AsyncValue.error(failure.message, StackTrace.current),
          showBannerRetry: true,
        ),
        (banners) =>
        state.copyWith(
          banners: AsyncValue.data(banners),
        ),
      );
    } catch (e) {
      state = state.copyWith(
        banners: AsyncValue.error('Failed to load banners: $e', StackTrace.current),
        showBannerRetry: true,
      );
      EshopLogger.error('HomeViewModel: Failed to load banners: $e');
    }
  }

  Future<void> reloadCategories() async {
    if (_debounceTimer?.isActive ?? false) return;
    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      final token = await _authService.getToken();
      if (token != null) await loadCategories(token);
    });
  }

  Future<void> reloadBanners() async {
    if (_debounceTimer?.isActive ?? false) return;
    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      final token = await _authService.getToken();
      if (token != null) await loadBanners(token);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  // Future<void> signOut() async {
  //   state = state.copyWith(isLoading: true);
  //   try {
  //     await _authService.clearToken();
  //     EshopLogger.info('Signed out successfully');
  //     state = state.copyWith(
  //       errorMessage: 'Signed out successfully',
  //       shouldNavigateToSignIn: true,
  //       isLoading: false,
  //     );
  //   } catch (e) {
  //     EshopLogger.error('Sign out failed: $e');
  //     state = state.copyWith(
  //       errorMessage: 'Sign out failed: $e',
  //       isLoading: false,
  //     );
  //   }
  // }
}
