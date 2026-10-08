// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_payment_method_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePaymentMethodRequest _$SavePaymentMethodRequestFromJson(
  Map<String, dynamic> json,
) => SavePaymentMethodRequest(
  token: json['token'] as String,
  lastFourDigits: json['lastFourDigits'] as String,
  brand: json['brand'] as String,
);

Map<String, dynamic> _$SavePaymentMethodRequestToJson(
  SavePaymentMethodRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'lastFourDigits': instance.lastFourDigits,
  'brand': instance.brand,
};
