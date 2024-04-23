import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_entries_viewmodel_state.dart';
part 'bmi_entries_viewmodel.freezed.dart';

class BmiEntriesViewmodel extends Cubit<BmiEntriesViewmodelState> {
  BmiEntriesViewmodel({required this.userRepo})
      : super(const BmiEntriesViewmodelState());
  final UserRepoInterface userRepo;
  static BmiEntriesViewmodel get(BuildContext context) =>
      BlocProvider.of<BmiEntriesViewmodel>(context);

  void getEntries({
    bool? nextPage,
  }) async {
    emit(reset().copyWith(isEntriesLoading: true));
    var result = await userRepo.fetchEntriesPerPage(
      entriesPerPage: 10,
      lastDocumentSnapshot: null,
    );
    result.when(
      success: (entries) {
        emit(
          reset().copyWith(
            isEntriesLoading: false,
            isEntriesSuccess: true,
            allEntries: [...state.allEntries, ...entries],
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isEntriesLoading: false,
            isEntriesError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  void nextEntries() async {}
  BmiEntriesViewmodelState reset() {
    return state.copyWith(
      isEntriesLoading: false,
      isEntriesError: false,
      isEntriesSuccess: false,
      nextEntries: [],
      isNextEntriesLoading: false,
      isNextEntriesError: false,
      isNextEntriesSuccess: false,
      error: null,
      isThereNextEntries: false,
    );
  }
}
