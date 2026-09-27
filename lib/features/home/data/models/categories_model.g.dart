// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => SubCategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'subCategories': instance.subCategories,
    };

SubCategoriesModel _$SubCategoriesModelFromJson(Map<String, dynamic> json) =>
    SubCategoriesModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubCategoriesModelToJson(SubCategoriesModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
