import 'dart:developer';

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
    emit(state.copyWith(loadNextPage: loadNextPage));
    log('loadNextPage cubit = ${state.loadNextPage}');
    var result = await bmiRepo.getBmiStream(
        limitQuery: loadNextPage
            ? state.entriesCountPerPage + 10
            : state.entriesCountPerPage);
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
}
