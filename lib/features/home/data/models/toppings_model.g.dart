// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toppings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToppingsModel _$ToppingsModelFromJson(Map<String, dynamic> json) =>
    ToppingsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      extraPrice: (json['extraPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$ToppingsModelToJson(ToppingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extraPrice': instance.extraPrice,
    };
