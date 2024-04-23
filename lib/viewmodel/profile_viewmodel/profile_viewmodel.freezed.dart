// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileViewmodelState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isLogoutError => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileViewmodelStateCopyWith<ProfileViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileViewmodelStateCopyWith<$Res> {
  factory $ProfileViewmodelStateCopyWith(ProfileViewmodelState value,
          $Res Function(ProfileViewmodelState) then) =
      _$ProfileViewmodelStateCopyWithImpl<$Res, ProfileViewmodelState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutError,
      String? error});
}

/// @nodoc
class _$ProfileViewmodelStateCopyWithImpl<$Res,
        $Val extends ProfileViewmodelState>
    implements $ProfileViewmodelStateCopyWith<$Res> {
  _$ProfileViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutError = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutError: null == isLogoutError
          ? _value.isLogoutError
          : isLogoutError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileViewmodelStateImplCopyWith<$Res>
    implements $ProfileViewmodelStateCopyWith<$Res> {
  factory _$$ProfileViewmodelStateImplCopyWith(
          _$ProfileViewmodelStateImpl value,
          $Res Function(_$ProfileViewmodelStateImpl) then) =
      __$$ProfileViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutError,
      String? error});
}

/// @nodoc
class __$$ProfileViewmodelStateImplCopyWithImpl<$Res>
    extends _$ProfileViewmodelStateCopyWithImpl<$Res,
        _$ProfileViewmodelStateImpl>
    implements _$$ProfileViewmodelStateImplCopyWith<$Res> {
  __$$ProfileViewmodelStateImplCopyWithImpl(_$ProfileViewmodelStateImpl _value,
      $Res Function(_$ProfileViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutError = null,
    Object? error = freezed,
  }) {
    return _then(_$ProfileViewmodelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutError: null == isLogoutError
          ? _value.isLogoutError
          : isLogoutError // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfileViewmodelStateImpl implements _ProfileViewmodelState {
  const _$ProfileViewmodelStateImpl(
      {this.isInitialized = false,
      this.isLogoutLoading = false,
      this.isLogoutSuccess = false,
      this.isLogoutError = false,
      this.error = null});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool isLogoutSuccess;
  @override
  @JsonKey()
  final bool isLogoutError;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'ProfileViewmodelState(isInitialized: $isInitialized, isLogoutLoading: $isLogoutLoading, isLogoutSuccess: $isLogoutSuccess, isLogoutError: $isLogoutError, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileViewmodelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.isLogoutSuccess, isLogoutSuccess) ||
                other.isLogoutSuccess == isLogoutSuccess) &&
            (identical(other.isLogoutError, isLogoutError) ||
                other.isLogoutError == isLogoutError) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isLogoutLoading,
      isLogoutSuccess, isLogoutError, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileViewmodelStateImplCopyWith<_$ProfileViewmodelStateImpl>
      get copyWith => __$$ProfileViewmodelStateImplCopyWithImpl<
          _$ProfileViewmodelStateImpl>(this, _$identity);
}

abstract class _ProfileViewmodelState implements ProfileViewmodelState {
  const factory _ProfileViewmodelState(
      {final bool isInitialized,
      final bool isLogoutLoading,
      final bool isLogoutSuccess,
      final bool isLogoutError,
      final String? error}) = _$ProfileViewmodelStateImpl;

  @override
  bool get isInitialized;
  @override
  bool get isLogoutLoading;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isLogoutError;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ProfileViewmodelStateImplCopyWith<_$ProfileViewmodelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
