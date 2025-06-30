import 'package:dartz/dartz.dart';
import '../../models/response/response.dart';
import '../../utils/http/http_client.dart';
import '../../models/category/category_model.dart'; // Import model

class CategoryRepository {
  final HttpClient _httpClient;

  CategoryRepository({required HttpClient httpClient}) : _httpClient = httpClient;

  Future<Either<ResponseFailure, List<CategoryModel>>> getAll(String token) async {
    try {
      final response = await _httpClient.get(
          'categories',
        headers: {
          'Authorization': 'Bearer $token', // Thêm token vào header
          'Content-Type': 'application/json',
        },
      );
      if (response.isNotEmpty) {
        final List<dynamic> data = response['data'] ?? [];
        print("Data $data");
        final categories = data.map((json) => CategoryModel.fromJson(json)).toList();
        return Right(categories);
      }
      final message = response['message'] ?? 'Failed to fetch categories';
      return Left(ResponseFailure(message));
    } catch (e) {
      return Left(ResponseFailure('Failed to fetch categories: $e'));
    }
  }
}