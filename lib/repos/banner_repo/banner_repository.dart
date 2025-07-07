


import 'package:dartz/dartz.dart';
import 'package:eshop/models/response/response.dart';

import '../../models/banner/banner_model.dart';
import '../../utils/http/http_client.dart';

class BannerRepository {
  final HttpClient _httpClient;

  BannerRepository({required HttpClient httpClient}) : _httpClient = httpClient;


  Future<Either<ResponseFailure, List<BannerModel>>> getAll(String token) async {
    try {
      final response = await _httpClient.get(
        'banners',
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }
      );

      if (response.isNotEmpty) {
        final List<dynamic> data = response['data'] ?? [];
        final banners = data.map((json) => BannerModel.fromJson(json)).toList();
        return Right(banners);
      }
      final message = response['message'] ?? 'Failed to fetch banners';
      return Left(ResponseFailure(message));


    } catch (e) {
      return Left(ResponseFailure('Failed to fetch banners: $e'));
    }
  }
}