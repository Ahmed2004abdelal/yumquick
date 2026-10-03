import 'package:json_annotation/json_annotation.dart';

part 'add_address_request.g.dart';

@JsonSerializable()
class AddAddressRequest {
  @JsonKey(name: 'label')
  final String name;
  @JsonKey(name: 'fullAddress')
  final String address;

  AddAddressRequest({required this.name, required this.address});

  factory AddAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestToJson(this);
}
