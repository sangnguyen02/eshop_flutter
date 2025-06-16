import 'package:dartz/dartz.dart';
import 'dart:convert';
import '../../../services/auth_service/auth_service.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/logging/logger.dart';
import '../../models/brand/brand_model.dart';

class BrandFailure {
  final String message;
  BrandFailure(this.message);
}

class BrandRepository {
  final HttpClient _httpClient;
  final AuthService _authService;

  BrandRepository({
    required HttpClient httpClient,
    required AuthService authService,
  })  : _httpClient = httpClient,
        _authService = authService;


  Future<Either<BrandFailure, List<BrandModel>>> getBrands({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final token = await _authService.getToken();
      final headers = {'Authorization': 'Bearer $token'};
      final response = await _httpClient.get(
        '${EshopHttpHelper.baseUrl}/brands?page=$page&pageSize=$pageSize',
        headers: headers,
      );
      EshopLogger.debug('BrandRepository: getBrands response: ${jsonEncode(response)}');

      if (response.containsKey('data')) {
        final brands = (response['data'] as List)
            .map((json) => BrandModel.fromJson(json))
            .toList();
        EshopLogger.info('BrandRepository: Fetched ${brands.length} brands');
        return Right(brands);
      }
      final message = response['error'] ?? 'Failed to fetch brands';
      EshopLogger.warning('BrandRepository: getBrands failed: $message');
      return Left(BrandFailure(message));
    } catch (e) {
      EshopLogger.error('BrandRepository: getBrands error: $e');
      return Left(BrandFailure('Can not fetch brands: $e'));
    }
  }
}