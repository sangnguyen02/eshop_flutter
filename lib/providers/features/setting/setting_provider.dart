import 'package:eshop/features/setting/view_model/setting_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../router/router.dart';
import '../../services/services_provider.dart';


final settingViewModelProvider = ChangeNotifierProvider<SettingViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  final authService = ref.watch(authServiceProvider);
  return SettingViewModel(authService, router, ref);
});
