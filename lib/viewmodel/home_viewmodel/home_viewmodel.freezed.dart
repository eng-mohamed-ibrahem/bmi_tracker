// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeViewModelState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isBmiCalculating => throw _privateConstructorUsedError;
  bool get isBmiCalculated => throw _privateConstructorUsedError;
  bool get isBmiCalculatedError => throw _privateConstructorUsedError;
  double? get bmiResult => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewModelStateCopyWith<HomeViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewModelStateCopyWith<$Res> {
  factory $HomeViewModelStateCopyWith(
          HomeViewModelState value, $Res Function(HomeViewModelState) then) =
      _$HomeViewModelStateCopyWithImpl<$Res, HomeViewModelState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isBmiCalculating,
      bool isBmiCalculated,
      bool isBmiCalculatedError,
      double? bmiResult,
      String? error});
}

/// @nodoc
class _$HomeViewModelStateCopyWithImpl<$Res, $Val extends HomeViewModelState>
    implements $HomeViewModelStateCopyWith<$Res> {
  _$HomeViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isBmiCalculating = null,
    Object? isBmiCalculated = null,
    Object? isBmiCalculatedError = null,
    Object? bmiResult = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculating: null == isBmiCalculating
          ? _value.isBmiCalculating
          : isBmiCalculating // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculated: null == isBmiCalculated
          ? _value.isBmiCalculated
          : isBmiCalculated // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculatedError: null == isBmiCalculatedError
          ? _value.isBmiCalculatedError
          : isBmiCalculatedError // ignore: cast_nullable_to_non_nullable
              as bool,
      bmiResult: freezed == bmiResult
          ? _value.bmiResult
          : bmiResult // ignore: cast_nullable_to_non_nullable
              as double?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeViewModelStateImplCopyWith<$Res>
    implements $HomeViewModelStateCopyWith<$Res> {
  factory _$$HomeViewModelStateImplCopyWith(_$HomeViewModelStateImpl value,
          $Res Function(_$HomeViewModelStateImpl) then) =
      __$$HomeViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isBmiCalculating,
      bool isBmiCalculated,
      bool isBmiCalculatedError,
      double? bmiResult,
      String? error});
}

/// @nodoc
class __$$HomeViewModelStateImplCopyWithImpl<$Res>
    extends _$HomeViewModelStateCopyWithImpl<$Res, _$HomeViewModelStateImpl>
    implements _$$HomeViewModelStateImplCopyWith<$Res> {
  __$$HomeViewModelStateImplCopyWithImpl(_$HomeViewModelStateImpl _value,
      $Res Function(_$HomeViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isBmiCalculating = null,
    Object? isBmiCalculated = null,
    Object? isBmiCalculatedError = null,
    Object? bmiResult = freezed,
    Object? error = freezed,
  }) {
    return _then(_$HomeViewModelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculating: null == isBmiCalculating
          ? _value.isBmiCalculating
          : isBmiCalculating // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculated: null == isBmiCalculated
          ? _value.isBmiCalculated
          : isBmiCalculated // ignore: cast_nullable_to_non_nullable
              as bool,
      isBmiCalculatedError: null == isBmiCalculatedError
          ? _value.isBmiCalculatedError
          : isBmiCalculatedError // ignore: cast_nullable_to_non_nullable
              as bool,
      bmiResult: freezed == bmiResult
          ? _value.bmiResult
          : bmiResult // ignore: cast_nullable_to_non_nullable
              as double?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeViewModelStateImpl implements _HomeViewModelState {
  const _$HomeViewModelStateImpl(
      {this.isInitialized = false,
      this.isBmiCalculating = false,
      this.isBmiCalculated = false,
      this.isBmiCalculatedError = false,
      this.bmiResult = null,
      this.error = null});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isBmiCalculating;
  @override
  @JsonKey()
  final bool isBmiCalculated;
  @override
  @JsonKey()
  final bool isBmiCalculatedError;
  @override
  @JsonKey()
  final double? bmiResult;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'HomeViewModelState(isInitialized: $isInitialized, isBmiCalculating: $isBmiCalculating, isBmiCalculated: $isBmiCalculated, isBmiCalculatedError: $isBmiCalculatedError, bmiResult: $bmiResult, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewModelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isBmiCalculating, isBmiCalculating) ||
                other.isBmiCalculating == isBmiCalculating) &&
            (identical(other.isBmiCalculated, isBmiCalculated) ||
                other.isBmiCalculated == isBmiCalculated) &&
            (identical(other.isBmiCalculatedError, isBmiCalculatedError) ||
                other.isBmiCalculatedError == isBmiCalculatedError) &&
            (identical(other.bmiResult, bmiResult) ||
                other.bmiResult == bmiResult) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isBmiCalculating,
      isBmiCalculated, isBmiCalculatedError, bmiResult, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewModelStateImplCopyWith<_$HomeViewModelStateImpl> get copyWith =>
      __$$HomeViewModelStateImplCopyWithImpl<_$HomeViewModelStateImpl>(
          this, _$identity);
}

abstract class _HomeViewModelState implements HomeViewModelState {
  const factory _HomeViewModelState(
      {final bool isInitialized,
      final bool isBmiCalculating,
      final bool isBmiCalculated,
      final bool isBmiCalculatedError,
      final double? bmiResult,
      final String? error}) = _$HomeViewModelStateImpl;

  @override
  bool get isInitialized;
  @override
  bool get isBmiCalculating;
  @override
  bool get isBmiCalculated;
  @override
  bool get isBmiCalculatedError;
  @override
  double? get bmiResult;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewModelStateImplCopyWith<_$HomeViewModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
