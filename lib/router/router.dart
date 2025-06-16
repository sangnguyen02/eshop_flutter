import 'package:eshop/features/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:eshop/features/auth/signup/view/sign_up_screen.dart';
import 'package:eshop/features/home/view/home_screen.dart';
import 'package:eshop/features/wishlist/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/signin/view/sign_in_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/setting/view/setting_screen.dart';
import '../features/store/view/store_screen.dart';
import '../providers/services/services_provider.dart';
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
        final isNavBarPath = state.uri.path.startsWith('/home') ||
            state.uri.path.startsWith('/store') ||
            state.uri.path.startsWith('/wishlist') ||
            state.uri.path.startsWith('/setting') ||
            state.uri.path.startsWith('/profile');

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
                routes: [
                  GoRoute(
                    path: 'profile', // Sub-route: /setting/profile
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ]
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