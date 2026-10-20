// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      fullName: json['FullName'] as String,
      email: json['Email'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      password: json['Password'] as String,
      role: json['role'] as String? ?? 'Customer',
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
      'Password': instance.password,
      'role': instance.role,
    };
