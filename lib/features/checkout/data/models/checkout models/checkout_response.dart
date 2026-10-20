import 'package:json_annotation/json_annotation.dart';

part 'checkout_response.g.dart';

@JsonSerializable()
class CheckoutResponse {
  final String message;
  final int orderId;
  String? clientSecret;

  CheckoutResponse({
    required this.message,
    required this.orderId,
    this.clientSecret,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}
