import 'package:dartz/dartz.dart';
import 'package:eshop/models/auth/signup/sign_up_request.dart';
import 'package:eshop/utils/snackbar/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../repos/auth_repo/auth_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository _repo;
  final GoRouter router;
  final Ref _ref;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String? selectedRole;
  bool isPasswordVisible = false;
  bool isLoading = false;

  SignUpViewModel(this._repo, this.router, this._ref);

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void setRole(String? role) {
    selectedRole = role;
    notifyListeners();
  }

  Future<Either<String, String>> signUp() async {
    isLoading = true;
    notifyListeners();

    if (usernameController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        fullnameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        selectedRole == null
    ) {
      // SnackBarUtils.showWarning(context, 'The information cannot be empty!');
      isLoading = false;
      notifyListeners();
      return const Left('The information cannot be empty!');
    }

    final request = SignUpRequest(
      username: usernameController.text.trim(),
      password: passwordController.text,
      fullname: fullnameController.text,
      phone: phoneController.text,
      email: emailController.text,
      role: selectedRole!,
    );

    final result = await _repo.signUp(request);
    return result.fold(
          (failure) {
            isLoading = false;
            notifyListeners();
            return Left(failure.message);
          },
          (response) async {
            // SnackBarUtils.showSuccess(context, 'Sign up successfully!');
            router.go('/signin');
            isLoading = false;
            notifyListeners();
            final message = response['message'] ?? 'Sign up successfully!';
            return Right(message);
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}