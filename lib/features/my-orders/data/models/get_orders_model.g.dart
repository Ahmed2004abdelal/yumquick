// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrdersModel _$GetOrdersModelFromJson(Map<String, dynamic> json) =>
    GetOrdersModel(
      id: (json['id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      itemCount: (json['itemCount'] as num).toInt(),
    );

Map<String, dynamic> _$GetOrdersModelToJson(GetOrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt.toIso8601String(),
      'itemCount': instance.itemCount,
    };
