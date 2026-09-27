// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleFavoriteModel _$ToggleFavoriteModelFromJson(Map<String, dynamic> json) =>
    ToggleFavoriteModel(
      message: json['message'] as String?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$ToggleFavoriteModelToJson(
  ToggleFavoriteModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'isFavorite': instance.isFavorite,
};

IsFavoriteRequest _$IsFavoriteRequestFromJson(Map<String, dynamic> json) =>
    IsFavoriteRequest(productId: (json['productId'] as num).toInt());

Map<String, dynamic> _$IsFavoriteRequestToJson(IsFavoriteRequest instance) =>
    <String, dynamic>{'productId': instance.productId};
