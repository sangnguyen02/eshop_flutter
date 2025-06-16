import 'package:dartz/dartz.dart';
import 'dart:convert';
import '../../../services/auth_service/auth_service.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/logging/logger.dart';
import '../../models/category/category_model.dart';

class CategoryFailure {
  final String message;
  CategoryFailure(this.message);
}

class CategoryRepository {
  final HttpClient _httpClient;
  final AuthService _authService;

  CategoryRepository({
    required HttpClient httpClient,
    required AuthService authService,
  })  : _httpClient = httpClient,
        _authService = authService;

  Future<Either<CategoryFailure, List<CategoryModel>>> getCategories({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final token = await _authService.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await _httpClient.get(
        '${EshopHttpHelper.baseUrl}/categories?page=$page&pageSize=$pageSize',
        headers: headers,
      );
      EshopLogger.debug('CategoryRepository: getCategories response: ${jsonEncode(response)}');

      if (response.containsKey('data')) {
        final categories = (response['data'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        EshopLogger.info('CategoryRepository: Fetched ${categories.length} categories');
        return Right(categories);
      }
      final message = response['error'] ?? 'Failed to fetch categories';
      EshopLogger.warning('CategoryRepository: getCategories failed: $message');
      return Left(CategoryFailure(message));
    } catch (e) {
      EshopLogger.error('CategoryRepository: getCategories error: $e');
      return Left(CategoryFailure('Can not fetch categories: $e'));
    }
  }


}