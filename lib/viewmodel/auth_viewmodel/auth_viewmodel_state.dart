part of 'auth_viewmodel.dart';

@freezed
class AuthViewModelState with _$AuthViewModelState {
  const factory AuthViewModelState({
    @Default(true) bool isInitialized,
    @Default(false) bool isSigninLoading,
    @Default(false) bool isSinginSuccess,
    @Default(false) bool isSinginError,
    @Default(null) String? userId,
    @Default(null) String? error,
  }) = _AuthViewModelState;
}
