import 'package:dartz/dartz.dart';
import 'package:eshop/providers/repositories/repositories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../providers/services/services_provider.dart';
import '../../../../repos/auth_repo/auth_repository.dart';
import '../../../../models/auth/signin/sign_in_request.dart';


class SignInViewModel extends ChangeNotifier {
  final AuthRepository _repo;
  final GoRouter router;
  final Ref _ref;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  SignInViewModel(this._repo, this.router, this._ref);

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }


  Future<Either<String, String>> signIn() async {
    isLoading = true;
    notifyListeners();

    if (usernameController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      isLoading = false;
      notifyListeners();
      return const Left('The username or password cannot be empty!');
    }

    final request = SignInRequest(
      username: usernameController.text.trim(),
      password: passwordController.text,
    );

    final result = await _repo.signIn(request);
    return result.fold(
          (failure) {
        isLoading = false;
        notifyListeners();
        return Left(failure.message);
      },
          (response) async {
        final token = response['data']['token'];
        await _ref.read(authServiceProvider).saveToken(token);
        usernameController.clear();
        passwordController.clear();

        router.go('/home');

        isLoading = false;
        notifyListeners();
        final message = response['message'] ?? 'Sign in successfully!';
        return Right(message);
      },
    );
  }


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}