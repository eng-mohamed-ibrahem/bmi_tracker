part of 'bmi_entries_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class BmiEntriesViewmodelState with _$BmiEntriesViewmodelState {
  const factory BmiEntriesViewmodelState({
    @Default(true) bool isInitialized,
    @Default(10) int entriesCountPerPage,
    @Default(0) int countLoadedEntries,
    @Default(10) int currentInRangEntries,
    @Default(false) bool loadNextPage,
    @Default(false) bool isStreamInitialized,
    @Default(false) bool isStreamError,
    @Default(null) Stream<QuerySnapshot<Map<String, dynamic>>>? bmiStream,
    @Default(null) DocumentSnapshot? lastDocumentSnapshot,
    @Default(false) bool isBmiEntryUpdating,
    @Default(false) bool isBmiEntryUpdated,
    @Default(false) bool isBmiEntryUpdatededError,
    @Default(false) bool isBmiEntryDeleting,
    @Default(false) bool isBmiEntryDeleted,
    @Default(false) bool isBmiEntryDeletedError,
    @Default(null) String? error,
  }) = _BmiEntriesViewmodelState;
}
