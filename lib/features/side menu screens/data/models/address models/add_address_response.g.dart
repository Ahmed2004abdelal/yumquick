// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressResponse _$AddAddressResponseFromJson(Map<String, dynamic> json) =>
    AddAddressResponse(
      message: json['message'] as String,
      addressId: (json['addressId'] as num).toInt(),
    );

Map<String, dynamic> _$AddAddressResponseToJson(AddAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addressId': instance.addressId,
    };
