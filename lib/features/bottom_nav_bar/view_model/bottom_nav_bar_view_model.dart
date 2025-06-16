import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/features/bottom_nav_bar/bottom_nav_provider.dart';


class BottomNavBarViewModel {
  final Ref _ref;

  BottomNavBarViewModel(this._ref);

  void navigateToTab(int index, {required StatefulNavigationShell navigationShell}) {
    _ref.read(bottomNavIndexProvider.notifier).state = index;
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}