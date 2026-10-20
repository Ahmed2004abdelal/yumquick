// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    CheckoutRequest(
      addressId: (json['addressId'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      couponCode: json['couponCode'] as String?,
      savedCardId: (json['savedCardId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'paymentMethod': instance.paymentMethod,
      'couponCode': instance.couponCode,
      'savedCardId': instance.savedCardId,
    };
