import 'package:dartz/dartz.dart';
import 'package:eshop/models/auth/signup/sign_up_request.dart';
import '../../models/response/response.dart';
import '../../utils/http/http_client.dart';
import '../../models/auth/signin/sign_in_request.dart';


class AuthRepository {
  final HttpClient _httpClient;

  AuthRepository({required HttpClient httpClient}) : _httpClient = httpClient;

  Future<Either<ResponseFailure, Map<String, dynamic>>> signIn(SignInRequest request) async {
    try {
      final response = await _httpClient.post('signin', request.toJson());
      // EshopLogger.debug('SignIn response: ${jsonEncode(response)}');
      if (response.containsKey('code') && response['code'] == 200) {
        return Right(response);
      }
      final message = response['message'] ?? 'Sign in failed';
      return Left(ResponseFailure(message));
    } catch (e) {
      return Left(ResponseFailure('Can not sign in: $e'));
    }
  }


  Future<Either<ResponseFailure, Map<String, dynamic>>> signUp(SignUpRequest request) async {
    try {
      final response = await _httpClient.post('signup', request.toJson());
      if (response.containsKey('code') && response['code'] == 201) {
        return Right(response);
      }
      final message = response['message'] ?? 'Sign in failed';
      return Left(ResponseFailure(message));
    } catch (e) {
      return Left(ResponseFailure('Can not sign in: $e'));
    }
  }
}