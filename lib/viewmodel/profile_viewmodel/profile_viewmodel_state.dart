part of 'profile_viewmodel.dart';

@freezed
class ProfileViewmodelState with _$ProfileViewmodelState {
  const factory ProfileViewmodelState({
    @Default(false) bool isInitialized,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isLogoutSuccess,
    @Default(false) bool isLogoutError,
    @Default(null) String? error,
  }) = _ProfileViewmodelState;
}
