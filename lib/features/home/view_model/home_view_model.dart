import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../services/auth_service/auth_service.dart';
import '../../../utils/logging/logger.dart';
import '../../../models/brand/brand_model.dart';
import '../../../models/category/category_model.dart';
import '../../../models/product/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthService _authService;
  final GoRouter router;
  // final ProductRepository _productRepository;
  // final CategoryRepository _categoryRepository;
  // final BrandRepository _brandRepository;
  final Ref _ref;

  final List<ProductModel> _products = [];
  final List<CategoryModel> _categories = [];
  final List<BrandModel> _brands = [];
  bool isLoading = false;
  int cartCount = 0;

  List<ProductModel> get products => _products;
  List<CategoryModel> get categories => _categories;
  List<BrandModel> get brands => _brands;

  String? errorMessage;
  bool shouldNavigateToSignIn = false;

  int _carouselCurrentIndex = 0;
  int get carouselCurrentIndex => _carouselCurrentIndex;

  HomeViewModel(
      this._authService,
      this.router,
      // this._productRepository,
      // this._categoryRepository,
      // this._brandRepository,
      this._ref,
      ) {
    // loadData();
  }

  void updatePageIndicator(int index) {
    _carouselCurrentIndex = index;
    notifyListeners();
  }

  // Future<void> loadData() async {
  //   isLoading = true;
  //   errorMessage = null;
  //   shouldNavigateToSignIn = false;
  //   notifyListeners();
  //
  //   try {
  //     final token = await _authService.getToken();
  //     if (token == null) {
  //       EshopLogger.error('HomeViewModel: No token found');
  //       errorMessage = 'No token found. Please sign in.';
  //       shouldNavigateToSignIn = true;
  //       return;
  //     }
  //
  //     final productsResult = await _productRepository.getProducts();
  //     productsResult.fold(
  //           (failure) => errorMessage = failure.message,
  //           (products) => _products = products,
  //     );
  //
  //     final categoriesResult = await _categoryRepository.getCategories();
  //     categoriesResult.fold(
  //           (failure) => errorMessage = failure.message,
  //           (categories) => _categories = categories,
  //     );
  //
  //     final brandsResult = await _brandRepository.getBrands();
  //     brandsResult.fold(
  //           (failure) => errorMessage = failure.message,
  //           (brands) => _brands = brands,
  //     );
  //   } catch (e) {
  //     errorMessage = 'Failed to load data: $e';
  //     EshopLogger.error('HomeViewModel: Failed to load data: $e');
  //   }
  //
  //   isLoading = false;
  //   notifyListeners();
  // }

  void addToCart(ProductModel product) {
    cartCount++;
    EshopLogger.info('Added ${product.name} to cart. Count: $cartCount');
    notifyListeners();
  }

  Future<void> signOut() async {
    isLoading = true;
    notifyListeners();

    try {
      await _authService.clearToken();
      EshopLogger.info('Signed out successfully');
      errorMessage = 'Signed out successfully';
      shouldNavigateToSignIn = true;
    } catch (e) {
      EshopLogger.error('Sign out failed: $e');
      errorMessage = 'Sign out failed: $e';
    }

    isLoading = false;
    // notifyListeners();
  }
}
