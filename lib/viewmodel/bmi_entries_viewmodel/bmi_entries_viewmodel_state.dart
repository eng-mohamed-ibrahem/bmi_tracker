part of 'bmi_entries_viewmodel.dart';

@freezed
class BmiEntriesViewmodelState with _$BmiEntriesViewmodelState {
  const BmiEntriesViewmodelState._();
  const factory BmiEntriesViewmodelState({
    @Default(true) bool isInitialized,
    @Default(10) int entriesCountPerPage,
    @Default(0) int countLoadedEntries,
    @Default(10) int currentLimit,
    @Default(false) bool loadNextPage,
    @Default(false) bool isStreamInitialized,
    @Default(false) bool isStreamError,
    required StreamController<QuerySnapshot<Map<String, dynamic>>>
        bmiStreamController,
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
