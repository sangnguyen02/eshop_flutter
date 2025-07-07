import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String slug;
  @JsonKey(name: 'parentId')
  final int? parentId;
  final String? image;
  final String? description;
  final bool? status;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.parentId,
    this.image,
    this.description,
    this.status,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}