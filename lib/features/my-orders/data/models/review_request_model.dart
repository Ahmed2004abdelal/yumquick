import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request_model.g.dart';

@JsonSerializable()
class ReviewRequestModel {
  final int orderId;
  final int productId;
  final int rating;
  final String comment;

  ReviewRequestModel({
    required this.orderId,
    required this.productId,
    required this.rating,
    required this.comment,
  });

  factory ReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewRequestModelToJson(this);
}