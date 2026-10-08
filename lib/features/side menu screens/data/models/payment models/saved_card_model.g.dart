// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCardModel _$SavedCardModelFromJson(Map<String, dynamic> json) =>
    SavedCardModel(
      id: (json['id'] as num).toInt(),
      lastFourDigits: json['lastFourDigits'] as String,
      brand: json['brand'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$SavedCardModelToJson(SavedCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastFourDigits': instance.lastFourDigits,
      'brand': instance.brand,
      'isDefault': instance.isDefault,
    };
