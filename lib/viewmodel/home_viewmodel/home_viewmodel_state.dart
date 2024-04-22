part of 'home_viewmodel.dart';

@freezed
class HomeViewModelState with _$HomeViewModelState {
  const factory HomeViewModelState({
    @Default(false) bool isInitialized,
    @Default(false) bool isBmiCalculating,
    @Default(false) bool isBmiCalculated,
    @Default(false) bool isBmiCalculatedError,
    @Default(null) double? bmiResult,
    @Default(null) String? error,
  }) = _HomeViewModelState;
}
