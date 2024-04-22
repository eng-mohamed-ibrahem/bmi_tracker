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
  $Res call({bool isInitialized});
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
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({bool isInitialized});
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
  }) {
    return _then(_$ProfileViewmodelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileViewmodelStateImpl implements _ProfileViewmodelState {
  const _$ProfileViewmodelStateImpl({this.isInitialized = false});

  @override
  @JsonKey()
  final bool isInitialized;

  @override
  String toString() {
    return 'ProfileViewmodelState(isInitialized: $isInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileViewmodelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileViewmodelStateImplCopyWith<_$ProfileViewmodelStateImpl>
      get copyWith => __$$ProfileViewmodelStateImplCopyWithImpl<
          _$ProfileViewmodelStateImpl>(this, _$identity);
}

abstract class _ProfileViewmodelState implements ProfileViewmodelState {
  const factory _ProfileViewmodelState({final bool isInitialized}) =
      _$ProfileViewmodelStateImpl;

  @override
  bool get isInitialized;
  @override
  @JsonKey(ignore: true)
  _$$ProfileViewmodelStateImplCopyWith<_$ProfileViewmodelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
