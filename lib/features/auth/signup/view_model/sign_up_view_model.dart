import 'package:dartz/dartz.dart';
import 'package:eshop/models/auth/signup/sign_up_request.dart';
import 'package:eshop/utils/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../repos/auth_repo/auth_repository.dart';

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
  bool agreeToTerms = false;

  SignUpViewModel(this._repo, this.router, this._ref);

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void setRole(String? role) {
    selectedRole = role;
    notifyListeners();
  }

  void toggleAgreeToTerms(bool? value) {
    agreeToTerms = value ?? false;
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

    if (!agreeToTerms) {
      isLoading = false;
      notifyListeners();
      return const Left('You must agree to the terms and conditions!');
    }

    final request = SignUpRequest(
      username: usernameController.text.trim(),
      password: passwordController.text,
      fullname: fullnameController.text,
      phone: phoneController.text,
      email: emailController.text,
      role: selectedRole!,
      status: true
    );
    EshopLogger.debug('SignUpRequest: ${request.toString()}');

    final result = await _repo.signUp(request);
    return result.fold(
          (failure) {
            isLoading = false;
            notifyListeners();
            return Left(failure.message);
          },
          (response) async {
            usernameController.clear();
            passwordController.clear();
            fullnameController.clear();
            phoneController.clear();
            emailController.clear();
            selectedRole = null;
            agreeToTerms = false;
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