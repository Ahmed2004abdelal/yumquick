import 'package:json_annotation/json_annotation.dart';

part 'checkout_request.g.dart';

@JsonSerializable()
class CheckoutRequest {
  final int addressId;
  final String paymentMethod;
  String? couponCode;
  int? savedCardId;

  CheckoutRequest({
    required this.addressId,
    required this.paymentMethod,
    this.couponCode,
    this.savedCardId,
  });

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutRequestToJson(this);
}
