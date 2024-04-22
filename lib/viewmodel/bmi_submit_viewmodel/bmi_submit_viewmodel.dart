import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_submit_viewmodel.freezed.dart';
part 'bmi_submit_viewmodel_state.dart';

class BmiSubmitViewmodel extends Cubit<BmiSubmitViewModelState> {
  BmiSubmitViewmodel({required this.userRepo})
      : super(const BmiSubmitViewModelState());
  final UserRepoInterface userRepo;
  static BmiSubmitViewmodel get(BuildContext context) =>
      BlocProvider.of<BmiSubmitViewmodel>(context);

  void calculateBmi(
      {required double height,
      required double weight,
      required int age}) async {
    emit(
      reset().copyWith(
        isBmiCalculated: true,
        bmiResult: double.parse((weight / (height * height / 10000))
            .toStringAsFixed(2)), // convert cm^2 to m^2
      ),
    );
    uploadMbi(height: height, weight: weight, mbi: state.bmiResult!, age: age);
  }

  void uploadMbi(
      {required double height,
      required double weight,
      required double mbi,
      required int age}) async {
    var result = await userRepo.uploadMbi(
        height: height, weight: weight, mbi: mbi, age: age);
    result.when(
      success: (uploaded) {
        emit(
          state.copyWith(
            isBmiUploaded: uploaded,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isBmiUploaded: false,
            isBmiUploadedError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  BmiSubmitViewModelState reset() {
    return state.copyWith(
      isInitialized: false,
      isBmiCalculated: false,
      isBmiUploaded: false,
      isBmiUploadedError: false,
      error: null,
    );
  }
}
