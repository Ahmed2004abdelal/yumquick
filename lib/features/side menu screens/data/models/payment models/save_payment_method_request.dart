import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_payment_method_request.g.dart';

@JsonSerializable()
class SavePaymentMethodRequest {
  final String token;
  final String lastFourDigits;
  final String brand;

  const SavePaymentMethodRequest({
    required this.token,
    required this.lastFourDigits,
    required this.brand,
  });

  factory SavePaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      _$SavePaymentMethodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SavePaymentMethodRequestToJson(this);
}
