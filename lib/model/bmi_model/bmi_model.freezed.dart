// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bmi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BmiModel _$BmiModelFromJson(Map<String, dynamic> json) {
  return _BmiModel.fromJson(json);
}

/// @nodoc
mixin _$BmiModel {
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get bmiResult => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BmiModelCopyWith<BmiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BmiModelCopyWith<$Res> {
  factory $BmiModelCopyWith(BmiModel value, $Res Function(BmiModel) then) =
      _$BmiModelCopyWithImpl<$Res, BmiModel>;
  @useResult
  $Res call(
      {double height, double weight, int age, double bmiResult, DateTime time});
}

/// @nodoc
class _$BmiModelCopyWithImpl<$Res, $Val extends BmiModel>
    implements $BmiModelCopyWith<$Res> {
  _$BmiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? age = null,
    Object? bmiResult = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      bmiResult: null == bmiResult
          ? _value.bmiResult
          : bmiResult // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BmiModelImplCopyWith<$Res>
    implements $BmiModelCopyWith<$Res> {
  factory _$$BmiModelImplCopyWith(
          _$BmiModelImpl value, $Res Function(_$BmiModelImpl) then) =
      __$$BmiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double height, double weight, int age, double bmiResult, DateTime time});
}

/// @nodoc
class __$$BmiModelImplCopyWithImpl<$Res>
    extends _$BmiModelCopyWithImpl<$Res, _$BmiModelImpl>
    implements _$$BmiModelImplCopyWith<$Res> {
  __$$BmiModelImplCopyWithImpl(
      _$BmiModelImpl _value, $Res Function(_$BmiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? age = null,
    Object? bmiResult = null,
    Object? time = null,
  }) {
    return _then(_$BmiModelImpl(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      bmiResult: null == bmiResult
          ? _value.bmiResult
          : bmiResult // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BmiModelImpl implements _BmiModel {
  const _$BmiModelImpl(
      {required this.height,
      required this.weight,
      required this.age,
      required this.bmiResult,
      required this.time});

  factory _$BmiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BmiModelImplFromJson(json);

  @override
  final double height;
  @override
  final double weight;
  @override
  final int age;
  @override
  final double bmiResult;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'BmiModel(height: $height, weight: $weight, age: $age, bmiResult: $bmiResult, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BmiModelImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bmiResult, bmiResult) ||
                other.bmiResult == bmiResult) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, height, weight, age, bmiResult, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BmiModelImplCopyWith<_$BmiModelImpl> get copyWith =>
      __$$BmiModelImplCopyWithImpl<_$BmiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BmiModelImplToJson(
      this,
    );
  }
}

abstract class _BmiModel implements BmiModel {
  const factory _BmiModel(
      {required final double height,
      required final double weight,
      required final int age,
      required final double bmiResult,
      required final DateTime time}) = _$BmiModelImpl;

  factory _BmiModel.fromJson(Map<String, dynamic> json) =
      _$BmiModelImpl.fromJson;

  @override
  double get height;
  @override
  double get weight;
  @override
  int get age;
  @override
  double get bmiResult;
  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$BmiModelImplCopyWith<_$BmiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
