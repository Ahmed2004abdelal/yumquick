// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAddressResponse _$GetAddressResponseFromJson(Map<String, dynamic> json) =>
    GetAddressResponse(
      id: (json['id'] as num).toInt(),
      name: json['label'] as String,
      address: json['fullAddress'] as String,
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$GetAddressResponseToJson(GetAddressResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.name,
      'fullAddress': instance.address,
      'isDefault': instance.isDefault,
    };
