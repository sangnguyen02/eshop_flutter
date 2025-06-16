import 'package:json_annotation/json_annotation.dart';

import '../brand/brand_model.dart';
import '../category/category_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  final int id;
  final String sku;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final double price;
  final double discountPrice;
  final int stockQuantity;
  final String status;
  final CategoryModel? category;
  final BrandModel? brand;
  @JsonKey(fromJson: _imageUrlsFromJson, toJson: _imageUrlsToJson)
  final List<String> imageUrls;

  ProductModel({
    required this.id,
    required this.sku,
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.discountPrice,
    required this.stockQuantity,
    required this.status,
    this.category,
    this.brand,
    this.imageUrls = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  static List<String> _imageUrlsFromJson(List<dynamic>? json) =>
      json?.map((img) => img['url']?.toString() ?? '').toList() ?? [];

  static List<Map<String, String>> _imageUrlsToJson(List<String> imageUrls) =>
      imageUrls.map((url) => {'url': url}).toList();
}