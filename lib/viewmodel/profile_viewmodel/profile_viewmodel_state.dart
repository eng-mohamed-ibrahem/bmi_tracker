part of 'profile_viewmodel.dart';

@freezed
class ProfileViewmodelState with _$ProfileViewmodelState {
  const factory ProfileViewmodelState({
    @Default(false) bool isInitialized,
  }) = _ProfileViewmodelState;
}
