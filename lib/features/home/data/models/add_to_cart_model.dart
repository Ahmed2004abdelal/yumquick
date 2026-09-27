import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_model.g.dart';

@JsonSerializable()
class AddToCartResponse {
  final String? message;

  AddToCartResponse({this.message});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}

@JsonSerializable()
class AddToCartRequest {
  final int? productId;
  final int? quantity;
  final List<int>? variantIds;

  AddToCartRequest({this.productId, this.quantity, this.variantIds});

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) =>
      _$AddToCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}
