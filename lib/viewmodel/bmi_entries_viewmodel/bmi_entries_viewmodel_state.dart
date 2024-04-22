part of 'bmi_entries_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BmiEntriesViewmodelState with _$BmiEntriesViewmodelState {
  const factory BmiEntriesViewmodelState({
    @Default(true) bool isInitialized,
    @Default(false) bool isEntriesLoading,
    @Default(false) bool isEntriesError,
    @Default(false) bool isEntriesSuccess,
    @Default([]) List<BmiModel> allEntries,
    @Default(10) int entriesCountPerPage,
    @Default(10) int currentEntries,
    @Default(false) bool isThereNextEntries,
    @Default(false) bool isNextEntriesLoading,
    @Default(false) bool isNextEntriesError,
    @Default(false) bool isNextEntriesSuccess,
    @Default(null) List<BmiModel>? nextEntries,
    @Default(null) String? error,
  }) = _BmiEntriesViewmodelState;
}
