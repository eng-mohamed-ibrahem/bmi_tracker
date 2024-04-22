// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthViewModelState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isSigninLoading => throw _privateConstructorUsedError;
  bool get isSinginSuccess => throw _privateConstructorUsedError;
  bool get isSinginError => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthViewModelStateCopyWith<AuthViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewModelStateCopyWith<$Res> {
  factory $AuthViewModelStateCopyWith(
          AuthViewModelState value, $Res Function(AuthViewModelState) then) =
      _$AuthViewModelStateCopyWithImpl<$Res, AuthViewModelState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isSigninLoading,
      bool isSinginSuccess,
      bool isSinginError,
      String? userId,
      String? error});
}

/// @nodoc
class _$AuthViewModelStateCopyWithImpl<$Res, $Val extends AuthViewModelState>
    implements $AuthViewModelStateCopyWith<$Res> {
  _$AuthViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isSigninLoading = null,
    Object? isSinginSuccess = null,
    Object? isSinginError = null,
    Object? userId = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isSigninLoading: null == isSigninLoading
          ? _value.isSigninLoading
          : isSigninLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSinginSuccess: null == isSinginSuccess
          ? _value.isSinginSuccess
          : isSinginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSinginError: null == isSinginError
          ? _value.isSinginError
          : isSinginError // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthViewModelStateImplCopyWith<$Res>
    implements $AuthViewModelStateCopyWith<$Res> {
  factory _$$AuthViewModelStateImplCopyWith(_$AuthViewModelStateImpl value,
          $Res Function(_$AuthViewModelStateImpl) then) =
      __$$AuthViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isSigninLoading,
      bool isSinginSuccess,
      bool isSinginError,
      String? userId,
      String? error});
}

/// @nodoc
class __$$AuthViewModelStateImplCopyWithImpl<$Res>
    extends _$AuthViewModelStateCopyWithImpl<$Res, _$AuthViewModelStateImpl>
    implements _$$AuthViewModelStateImplCopyWith<$Res> {
  __$$AuthViewModelStateImplCopyWithImpl(_$AuthViewModelStateImpl _value,
      $Res Function(_$AuthViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isSigninLoading = null,
    Object? isSinginSuccess = null,
    Object? isSinginError = null,
    Object? userId = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AuthViewModelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isSigninLoading: null == isSigninLoading
          ? _value.isSigninLoading
          : isSigninLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSinginSuccess: null == isSinginSuccess
          ? _value.isSinginSuccess
          : isSinginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSinginError: null == isSinginError
          ? _value.isSinginError
          : isSinginError // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthViewModelStateImpl implements _AuthViewModelState {
  const _$AuthViewModelStateImpl(
      {this.isInitialized = true,
      this.isSigninLoading = false,
      this.isSinginSuccess = false,
      this.isSinginError = false,
      this.userId = null,
      this.error = null});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isSigninLoading;
  @override
  @JsonKey()
  final bool isSinginSuccess;
  @override
  @JsonKey()
  final bool isSinginError;
  @override
  @JsonKey()
  final String? userId;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'AuthViewModelState(isInitialized: $isInitialized, isSigninLoading: $isSigninLoading, isSinginSuccess: $isSinginSuccess, isSinginError: $isSinginError, userId: $userId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewModelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isSigninLoading, isSigninLoading) ||
                other.isSigninLoading == isSigninLoading) &&
            (identical(other.isSinginSuccess, isSinginSuccess) ||
                other.isSinginSuccess == isSinginSuccess) &&
            (identical(other.isSinginError, isSinginError) ||
                other.isSinginError == isSinginError) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isSigninLoading,
      isSinginSuccess, isSinginError, userId, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewModelStateImplCopyWith<_$AuthViewModelStateImpl> get copyWith =>
      __$$AuthViewModelStateImplCopyWithImpl<_$AuthViewModelStateImpl>(
          this, _$identity);
}

abstract class _AuthViewModelState implements AuthViewModelState {
  const factory _AuthViewModelState(
      {final bool isInitialized,
      final bool isSigninLoading,
      final bool isSinginSuccess,
      final bool isSinginError,
      final String? userId,
      final String? error}) = _$AuthViewModelStateImpl;

  @override
  bool get isInitialized;
  @override
  bool get isSigninLoading;
  @override
  bool get isSinginSuccess;
  @override
  bool get isSinginError;
  @override
  String? get userId;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AuthViewModelStateImplCopyWith<_$AuthViewModelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
