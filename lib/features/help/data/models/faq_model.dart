import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable()
class FaqModel {
  final int id;
  final String category;
  final String question;
  final String answer;

  FaqModel({
    required this.id,
    required this.category,
    required this.question,
    required this.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}
