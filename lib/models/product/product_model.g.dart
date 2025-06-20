// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      status: json['status'] as String,
      category: json['brand'] == null
          ? null
          : CategoryModel.fromJson(json['brand'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      imageUrls: json['imageUrls'] == null
          ? const []
          : ProductModel._imageUrlsFromJson(json['imageUrls'] as List?),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'stockQuantity': instance.stockQuantity,
      'status': instance.status,
      'brand': instance.category?.toJson(),
      'brand': instance.brand?.toJson(),
      'imageUrls': ProductModel._imageUrlsToJson(instance.imageUrls),
    };
