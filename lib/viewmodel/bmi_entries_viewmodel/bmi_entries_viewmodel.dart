import 'dart:developer';

import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/repositories/bmi_repository/bmi_repo_interface.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_entries_viewmodel.freezed.dart';
part 'bmi_entries_viewmodel_state.dart';

class BmiEntriesViewmodel extends Cubit<BmiEntriesViewmodelState> {
  BmiEntriesViewmodel({required this.bmiRepo, required this.userRepo})
      : super(const BmiEntriesViewmodelState());
  final BmiRepoInterface bmiRepo;
  final UserRepoInterface userRepo;
  static BmiEntriesViewmodel get(BuildContext context) =>
      BlocProvider.of<BmiEntriesViewmodel>(context);

  void bmiStream({bool loadNextPage = false}) async {
    emit(reset().copyWith(loadNextPage: loadNextPage));
    areMoreEntries();
    var result =
        await bmiRepo.getBmiStream(limitQuery: state.currentInRangEntries);
    log('=========================================================');
    log('current in range entries : ${state.currentInRangEntries}');
    log('=========================================================');
    result.when(
      success: (stream) {
        emit(
          state.copyWith(
            isStreamInitialized: true,
            bmiStream: stream,
            loadNextPage: false,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isStreamError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  void setLastDocumentSnapshot(
      {required DocumentSnapshot lastDocumentSnapshot}) {
    emit(state.copyWith(lastDocumentSnapshot: lastDocumentSnapshot));
  }

  void areMoreEntries() async {
    await bmiRepo.areThereMoreEntries(docRef: state.lastDocumentSnapshot!).then(
      (result) {
        result.when(
          success: (value) {
            if (value) {
              emit(state.copyWith(
                  currentInRangEntries:
                      state.currentInRangEntries + state.entriesCountPerPage));
            }
          },
          failure: (failure) {
            emit(state.copyWith(isStreamError: true, error: failure.message));
          },
        );
      },
    );
  }

  void updateBmiEntry({
    required String bmiEntryReference,
    required BmiModel bmiModel,
    required double height,
    required double weight,
  }) async {
    emit(reset().copyWith(isBmiEntryUpdating: true));
    var newEntry = bmiModel.copyWith(
      height: height,
      weight: weight,
      bmiResult: height == 0 && weight == 0
          ? bmiModel.bmiResult
          : double.parse(
              (weight / (height * height / 10000)).toStringAsFixed(2),
            ),
    );
    var result = await userRepo.updateBmiEntry(
      bmiEntryReference: bmiEntryReference,
      updatedBmiModel: newEntry,
    );

    result.when(
      success: (updatedEntry) {
        emit(
          state.copyWith(
            isBmiEntryUpdating: false,
            isBmiEntryUpdated: true,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isBmiEntryUpdating: false,
            isBmiEntryUpdatededError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  void deleteBmiEntry({required String bmiEntryReference}) async {
    emit(reset().copyWith(isBmiEntryDeleting: true));
    var result =
        await userRepo.deleteBmiEntry(bmiEntryReference: bmiEntryReference);
    result.when(
      success: (deleted) {
        emit(
          state.copyWith(
            isBmiEntryDeleting: false,
            isBmiEntryDeleted: deleted,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isBmiEntryDeleting: false,
            isBmiEntryDeletedError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  BmiEntriesViewmodelState reset() {
    return state.copyWith(
      isStreamError: false,
      error: null,
      isBmiEntryUpdated: false,
      isBmiEntryUpdatededError: false,
      isBmiEntryUpdating: false,
      isBmiEntryDeleting: false,
      isBmiEntryDeleted: false,
      isBmiEntryDeletedError: false,
    );
  }
}
