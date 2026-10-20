// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsModel _$ContactUsModelFromJson(Map<String, dynamic> json) =>
    ContactUsModel(
      id: (json['id'] as num).toInt(),
      platform: json['platform'] as String,
      urlOrNumber: json['urlOrNumber'] as String,
    );

Map<String, dynamic> _$ContactUsModelToJson(ContactUsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'urlOrNumber': instance.urlOrNumber,
    };
