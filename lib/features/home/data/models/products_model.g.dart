// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      originalPrice: (json['originalPrice'] as num).toDouble(),
      discountPercent: (json['discountPercent'] as num).toDouble(),
      finalPrice: (json['finalPrice'] as num).toDouble(),
      ratingAvg: (json['ratingAvg'] as num).toDouble(),
      isNew: json['isNew'] as bool,
      toppings: (json['variants'] as List<dynamic>)
          .map((e) => ToppingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'originalPrice': instance.originalPrice,
      'discountPercent': instance.discountPercent,
      'finalPrice': instance.finalPrice,
      'ratingAvg': instance.ratingAvg,
      'isNew': instance.isNew,
      'variants': instance.toppings,
      'categoryName': instance.categoryName,
    };
