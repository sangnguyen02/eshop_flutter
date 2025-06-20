import 'package:eshop/features/store/view_model/store_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../router/router.dart';

final storeViewModelProvider = ChangeNotifierProvider<StoreViewModel>((ref) {
  final router = ref.watch(appRouterProvider);
  return StoreViewModel(router, ref);
});