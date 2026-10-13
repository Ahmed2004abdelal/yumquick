import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_order_model.g.dart';

@JsonSerializable()
class CompleteOrderModel {
  final int id;
  @JsonKey(name: 'status')
  final int orderStatus;
  @JsonKey(name: 'subtotal')
  final double subTotal;
  final double deliveryFee;
  final double taxFee;
  final double discountAmount;
  final double totalAmount;
  final DateTime createdAt;
  final OrderAddressModel? address;
  final List<ItemsModel> items;

  CompleteOrderModel({
    required this.id,
    required this.orderStatus,
    required this.subTotal,
    required this.deliveryFee,
    required this.taxFee,
    required this.discountAmount,
    required this.totalAmount,
    required this.createdAt,
    this.address,
    required this.items,
  });

  factory CompleteOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteOrderModelToJson(this);
}

@JsonSerializable()
class OrderAddressModel {
  final String label;
  final String fullAddress;

  OrderAddressModel({required this.label, required this.fullAddress});

  factory OrderAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAddressModelToJson(this);
}

@JsonSerializable()
class ItemsModel {
  final int productId;
  final String productName;
  final String productImage;
  final int quantity;
  final double unitPriceSnapshot;
  @JsonKey(defaultValue: [])
  final List<Variants> variants;

  ItemsModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.unitPriceSnapshot,
    required this.variants,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}

@JsonSerializable()
class Variants {
  final String name;
  // @JsonKey(defaultValue: 0)
  final double extraPriceSnapshot;

  Variants({required this.name, required this.extraPriceSnapshot});

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);

  Map<String, dynamic> toJson() => _$VariantsToJson(this);
}
