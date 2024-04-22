part of 'bmi_submit_viewmodel.dart';

@freezed
class BmiSubmitViewModelState with _$BmiSubmitViewModelState {
  const factory BmiSubmitViewModelState({
    @Default(false) bool isInitialized,
    @Default(false) bool isBmiCalculated,
    @Default(null) double? bmiResult,
    @Default(false) bool isBmiUploaded,
    @Default(false) bool isBmiUploadedError,
    @Default(null) String? error,
  }) = _HomeViewModelState;
}
