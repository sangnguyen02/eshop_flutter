import 'package:dartz/dartz.dart';
import '../../models/brand/brand_model.dart';
import '../../models/response/response.dart';
import '../../utils/http/http_client.dart';

class BrandRepository {
  final HttpClient _httpClient;

  BrandRepository({required HttpClient httpClient}) : _httpClient = httpClient;

  Future<Either<ResponseFailure, List<BrandModel>>> getAll(String token) async {
    try {
      final response = await _httpClient.get(
        'brands',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.isNotEmpty) {
        final List<dynamic> data = response['data'] ?? [];
        // print("Data $data");
        final brands = data.map((json) => BrandModel.fromJson(json)).toList();
        return Right(brands);
      }
      final message = response['message'] ?? 'Failed to fetch brands';
      return Left(ResponseFailure(message));
    } catch (e) {
      return Left(ResponseFailure('Failed to fetch brands: $e'));
    }
  }
}