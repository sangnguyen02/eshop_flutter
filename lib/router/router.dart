import 'package:eshop/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:eshop/features/auth/signup/view/sign_up_screen.dart';
import 'package:eshop/features/brands/view/brand_products.dart';
import 'package:eshop/features/cart/view/cart_screen.dart';
import 'package:eshop/features/category/view/category_screen.dart';
import 'package:eshop/features/checkout/view/checkout_screen.dart';
import 'package:eshop/features/home/view/home_screen.dart';
import 'package:eshop/features/order/view/order_screen.dart';
import 'package:eshop/features/product_details/view/product_details_screen.dart';
import 'package:eshop/features/product_reviews/view/product_reviews_screen.dart';
import 'package:eshop/features/user_address/view/add_user_address_screen.dart';
import 'package:eshop/features/user_address/view/user_address_screen.dart';
import 'package:eshop/features/wishlist/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/widgets/success_screen/success_screen.dart';
import '../features/auth/signin/view/sign_in_screen.dart';
import '../features/brands/view/all_brands_screen.dart';
import '../features/products/view/all_products_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/setting/view/setting_screen.dart';
import '../features/store/view/store_screen.dart';
import '../providers/services/services_provider.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/text_strings.dart';
import '../utils/logging/logger.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProvider);

  return GoRouter(
    initialLocation: '/signin',
    redirect: (context, state) async {
      EshopLogger.info('GoRouter redirect called: path=${state.uri.path}');
      try {
        final token = await authService.getToken();
        // EshopLogger.info('Token in redirect: $token');
        final isAuthPath = state.uri.path == '/signin' || state.uri.path == '/signup';
        // final isNavBarPath = state.uri.path.startsWith('/home') ||
        //     state.uri.path.startsWith('/store') ||
        //     state.uri.path.startsWith('/wishlist') ||
        //     state.uri.path.startsWith('/setting') ||
        //     state.uri.path.startsWith('/profile');

        if (token == null && !isAuthPath) {
          EshopLogger.info('Redirecting to /signin: token is null');
          return '/signin';
        }
        if (token != null && isAuthPath) {
          EshopLogger.info('Redirecting to /home: token exists');
          return '/home';
        }
        // EshopLogger.info('No redirect needed');
        return null;
      } catch (e) {
        EshopLogger.error('Error in redirect: $e');
        return '/signin'; // Fallback to sign-in on error
      }
    },
    routes: [
      GoRoute(
          path: '/signin',
          builder: (context, state) => const SignInScreen()
      ),
      GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen()
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/payment-success',
        builder: (context, state) {
          final queryParams = state.uri.queryParameters;
          final image = queryParams['image'] ?? EshopImages.paymentSuccess;
          final title = queryParams['title'] ?? EshopTexts.paymentTitle;
          final subTitle = queryParams['subTitle'] ?? EshopTexts.paymentSubTitle;
          return SuccessScreen(
            image: image,
            title: title,
            subTitle: subTitle,
            onPressed: () => GoRouter.of(context).go('/home'),
          );
        },
      ),
      GoRoute(
        path: '/category',
        builder: (context, state) => const CategoryScreen(),
      ),
      GoRoute(
        path: '/all-products',
        builder: (context, state) => const AllProductsScreen(),
      ),
      GoRoute(
        path: '/all-brands',
        builder: (context, state) => const AllBrandsScreen(),
      ),
      GoRoute(
        path: '/brand-products',
        builder: (context, state) => const BrandProducts(),
      ),
      GoRoute(
          path: '/product-detail',
          builder: (context, state) => const ProductDetailsScreen()
      ),
      GoRoute(
          path: '/product-reviews',
          builder: (context, state) => const ProductReviewsScreen()
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
          path: '/user-address',
          builder: (context, state) => const UserAddressScreen(),
          routes: [
            GoRoute(
                path: '/add',
                builder: (context, state) => const AddUserAddressScreen()
            ),
          ]
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BottomNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/store',
                builder: (context, state) => const StoreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wishlist',
                builder: (context, state) => const WishlistScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/setting',
                builder: (context, state) => const SettingScreen(),
              ),
            ],
          ),
        ],
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.path}')),
    ),
  );
});