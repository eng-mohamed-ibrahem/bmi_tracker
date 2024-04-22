import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewModelState> {
  HomeViewmodel({required this.userRepo}) : super(const HomeViewModelState());
  final UserRepoInterface userRepo;
  static HomeViewmodel get(BuildContext context) =>
      BlocProvider.of<HomeViewmodel>(context);

  void calculateBmi({required double height, required double weight}) {
    emit(reset().copyWith(isBmiCalculating: true));
    try {
      emit(
        state.copyWith(
          isBmiCalculating: false,
          isBmiCalculated: true,
          bmiResult: weight / (height * height / 10000),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isBmiCalculating: false,
          isBmiCalculated: false,
          isBmiCalculatedError: true,
          error: e.toString(),
        ),
      );
    }
  }

  HomeViewModelState reset() {
    return state.copyWith(
      isBmiCalculating: false,
      isBmiCalculated: false,
      isBmiCalculatedError: false,
      error: null,
    );
  }
}
