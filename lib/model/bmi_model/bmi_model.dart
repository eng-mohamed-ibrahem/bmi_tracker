import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_model.freezed.dart';
part 'bmi_model.g.dart';

@freezed
class BmiModel with _$BmiModel {
  const factory BmiModel({
    required double height,
    required double weight,
    required int age,
    required double bmiResult,
    required DateTime time,
  }) = _BmiModel;

  factory BmiModel.fromJson(Map<String, dynamic> json) =>
      _$BmiModelFromJson(json);
}
