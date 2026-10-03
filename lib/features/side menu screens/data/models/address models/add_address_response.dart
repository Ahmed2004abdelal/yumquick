import 'package:json_annotation/json_annotation.dart';

part 'add_address_response.g.dart';

@JsonSerializable()
class AddAddressResponse {
  final String message;
  final int addressId;

  AddAddressResponse({required this.message, required this.addressId});

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressResponseToJson(this);
}
