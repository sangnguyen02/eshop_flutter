import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../providers/features/bottom_nav_bar/bottom_nav_provider.dart';
import '../../../utils/constants/sizes.dart';



class BottomNavBar extends ConsumerWidget {

  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final darkMode = EshopHelperFunctions.isDarkMode(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final path = GoRouterState.of(context).uri.path;
      const routes = ['/home', '/cart', '/wishlist', '/setting'];
      final index = routes.indexWhere((route) => path.startsWith(route));
      if (index != -1 && index != selectedIndex) {
        ref.read(bottomNavIndexProvider.notifier).state = index;
      }
    });

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: EshopSizes.bottomNavBarHeight,
        elevation: 0,
        backgroundColor: darkMode ? EshopColors.dark : Colors.white,
        indicatorColor: darkMode ? EshopColors.white.withOpacity(0.1) : EshopColors.dark.withOpacity(0.1),


        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          ref.read(bottomNavBarViewModelProvider).navigateToTab(
            index,
            navigationShell: navigationShell,
          );
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.setting), label: 'Setting'),
        ],

      ),
      body: ProviderScope(
        overrides: [
          navigationShellProvider.overrideWithValue(navigationShell),
        ],
        child: navigationShell,
      ),

    );
  }
}
