import 'package:dartz/dartz.dart';
import 'dart:convert';
import '../../../services/auth_service/auth_service.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/logging/logger.dart';
import '../../models/product/product_model.dart';


class ProductFailure {
  final String message;
  ProductFailure(this.message);
}

class ProductRepository {
  final HttpClient _httpClient;
  final AuthService _authService;

  ProductRepository({
    required HttpClient httpClient,
    required AuthService authService,
  })  : _httpClient = httpClient,
        _authService = authService;

  Future<Either<ProductFailure, List<ProductModel>>> getProducts({
    String search = '',
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final token = await _authService.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await _httpClient.get(
        '${EshopHttpHelper.baseUrl}/products/search?name=$search&page=$page&pageSize=$pageSize',
        headers: headers,
      );
      EshopLogger.debug('ProductRepository: getProducts response: ${jsonEncode(response)}');

      if (response.containsKey('data')) {
        final products = (response['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
        EshopLogger.info('ProductRepository: Fetched ${products.length} products');
        return Right(products);
      }
      final message = response['error'] ?? 'Failed to fetch products';
      EshopLogger.warning('ProductRepository: getProducts failed: $message');
      return Left(ProductFailure(message));
    } catch (e) {
      EshopLogger.error('ProductRepository: getProducts error: $e');
      return Left(ProductFailure('Can not fetch products: $e'));
    }
  }
}