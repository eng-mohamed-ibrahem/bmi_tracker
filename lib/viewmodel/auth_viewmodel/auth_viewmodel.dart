import 'package:bmi_tracker/repositories/auth_repository/auth_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_viewmodel_state.dart';
part 'auth_viewmodel.freezed.dart';

class AuthViewmodel extends Cubit<AuthViewModelState> {
  AuthViewmodel({required this.authRepo}) : super(const AuthViewModelState());
  final AuthRepoInterface authRepo;
  static AuthViewmodel get(BuildContext context) =>
      BlocProvider.of<AuthViewmodel>(context);

  void signinAnonymously() async {
    emit(reset().copyWith(isSigninLoading: true));
    var result = await authRepo.signinAnonymously();
    result.when(
      success: (userId) {
        emit(
          state.copyWith(
            isSigninLoading: false,
            isSinginSuccess: true,
            userId: userId,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isSigninLoading: false,
            isSinginSuccess: false,
            isSinginError: true,
            error: failure.message,
          ),
        );
      },
    );
  }

  AuthViewModelState reset() {
    return state.copyWith(
      isSigninLoading: false,
      isSinginSuccess: false,
      isSinginError: false,
      error: null,
    );
  }
}
