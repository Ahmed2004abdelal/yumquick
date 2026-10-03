import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_address_response.g.dart';

@JsonSerializable()
class GetAddressResponse {
  final int id;
  @JsonKey(name: 'label')
  final String name;
  @JsonKey(name: 'fullAddress')
  final String address;
  final bool isDefault;

  GetAddressResponse({
    required this.id,
    required this.name,
    required this.address,
    required this.isDefault,
  });

  factory GetAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAddressResponseToJson(this);
}
