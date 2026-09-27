import 'package:freezed_annotation/freezed_annotation.dart';

part 'toppings_model.g.dart';

@JsonSerializable()
class ToppingsModel {
  final int id;
  final String name;
  final double extraPrice;

  ToppingsModel({
    required this.id,
    required this.name,
    required this.extraPrice,
  });

  factory ToppingsModel.fromJson(Map<String, dynamic> json) =>
      _$ToppingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToppingsModelToJson(this);
}
