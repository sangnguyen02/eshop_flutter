import 'package:eshop/providers/services/services_provider.dart';
import 'package:eshop/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/auth/signin/view_model/sign_in_view_model.dart';
import '../../../features/auth/signup/view_model/sign_up_view_model.dart';
import '../../repositories/repositories_provider.dart';

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final router = ref.watch(appRouterProvider);
  return SignInViewModel(authRepository, router, ref);
});

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final router = ref.watch(appRouterProvider);
  return SignUpViewModel(authRepository, router, ref);
});

