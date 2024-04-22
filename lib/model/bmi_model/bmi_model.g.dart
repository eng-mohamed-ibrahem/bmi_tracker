// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BmiModelImpl _$$BmiModelImplFromJson(Map<String, dynamic> json) =>
    _$BmiModelImpl(
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      age: json['age'] as int,
      bmiResult: (json['bmiResult'] as num).toDouble(),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$BmiModelImplToJson(_$BmiModelImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'bmiResult': instance.bmiResult,
      'time': instance.time.toIso8601String(),
    };
