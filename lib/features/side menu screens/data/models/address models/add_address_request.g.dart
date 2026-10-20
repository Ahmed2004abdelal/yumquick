// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequest _$AddAddressRequestFromJson(Map<String, dynamic> json) =>
    AddAddressRequest(
      name: json['label'] as String,
      address: json['fullAddress'] as String,
    );

Map<String, dynamic> _$AddAddressRequestToJson(AddAddressRequest instance) =>
    <String, dynamic>{'label': instance.name, 'fullAddress': instance.address};
