// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    CheckoutResponse(
      message: json['message'] as String,
      orderId: (json['orderId'] as num).toInt(),
      clientSecret: json['clientSecret'] as String?,
    );

Map<String, dynamic> _$CheckoutResponseToJson(CheckoutResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orderId': instance.orderId,
      'clientSecret': instance.clientSecret,
    };
