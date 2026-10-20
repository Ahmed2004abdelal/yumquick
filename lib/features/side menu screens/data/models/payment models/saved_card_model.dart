import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_card_model.g.dart';

@JsonSerializable()
class SavedCardModel {
  final int id;
  final String lastFourDigits;
  final String brand;
  final bool isDefault;

  SavedCardModel({
    required this.id,
    required this.lastFourDigits,
    required this.brand,
    required this.isDefault,
  });

  factory SavedCardModel.fromJson(Map<String, dynamic> json) =>
      _$SavedCardModelFromJson(json);
}
