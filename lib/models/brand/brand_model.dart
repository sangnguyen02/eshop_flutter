import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'logoUrl')
  final String? logoUrl;
  final String? description; // Thêm trường
  final bool? status;

  BrandModel({
    required this.id,
    required this.name,
    required this.slug,
    this.logoUrl,
    this.description,
    this.status,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}