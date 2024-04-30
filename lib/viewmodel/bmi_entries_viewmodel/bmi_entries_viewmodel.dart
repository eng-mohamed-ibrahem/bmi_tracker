import 'dart:async';
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
      : super(BmiEntriesViewmodelState(
          bmiStreamController:
              StreamController<QuerySnapshot<Map<String, dynamic>>>.broadcast(),
        ));
  final BmiRepoInterface bmiRepo;
  final UserRepoInterface userRepo;
  static BmiEntriesViewmodel get(BuildContext context) =>
      BlocProvider.of<BmiEntriesViewmodel>(context);

  void bmiStream({bool loadNextPage = false}) async {
    emit(reset().copyWith(loadNextPage: loadNextPage));
    var result = await bmiRepo.getBmiStream(
        limitQuery: state.entriesCountPerPage,
        docRef: state.lastDocumentSnapshot);
    log('BMI Entries: $result');
    result.when(
      success: (stream) {
        var subscription = stream.listen(
          (event) {
            if (event.docs.isNotEmpty) {
              state.bmiStreamController.add(event);
              emit(
                state.copyWith(
                  lastDocumentSnapshot: event.docs.last,
                ),
              );
              log('last document: ${event.docs.last}');
            }
          },
        );
        subscription.onDone(() {
          subscription.cancel();
        });
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

  void updateBmiEntry({
    required String bmiEntryReference,
    required BmiModel bmiModel,
    required double height,
    required double weight,
  }) async {
    if (height == 0 && weight == 0) {
      return;
    }
    emit(reset().copyWith(isBmiEntryUpdating: true));
    height = height == 0 ? bmiModel.height : height;
    weight = weight == 0 ? bmiModel.weight : weight;
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
