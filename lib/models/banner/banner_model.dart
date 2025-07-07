import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final int id;
  final String name;
  final String image;
  final bool? status;

  BannerModel({
    required this.id,
    required this.name,
    required this.image,
    this.status,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}