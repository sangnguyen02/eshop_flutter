import 'package:eshop/services/auth_service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingViewModel extends ChangeNotifier {
  final AuthService authService;
  final GoRouter router;
  final Ref _ref;

  SettingViewModel(this.authService, this.router, this._ref);


  Future<void> signOut() async {
    await authService.clearToken();
    router.go('/signin');
  }

}
