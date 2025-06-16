import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/bottom_nav_bar/view_model/bottom_nav_bar_view_model.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final bottomNavBarViewModelProvider = Provider<BottomNavBarViewModel>((ref) {
  return BottomNavBarViewModel(ref);
});

final navigationShellProvider = Provider<StatefulNavigationShell>((ref) {
  throw UnimplementedError('navigationShellProvider must be overridden');
});