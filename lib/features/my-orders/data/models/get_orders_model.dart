import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orders_model.g.dart';

@JsonSerializable()
class GetOrdersModel {
  final int id;
  final int status;
  final double totalAmount;
  final DateTime createdAt;
  final int itemCount;

  GetOrdersModel({
    required this.id,
    required this.status,
    required this.totalAmount,
    required this.createdAt,
    required this.itemCount,
  });

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersModelToJson(this);
}
