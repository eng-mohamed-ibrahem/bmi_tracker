import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_viewmodel.freezed.dart';
part 'profile_viewmodel_state.dart';

class ProfileViewmodel extends Cubit<ProfileViewmodelState> {
  ProfileViewmodel({required this.userRepo})
      : super(const ProfileViewmodelState());
  final UserRepoInterface userRepo;

  static ProfileViewmodel get(BuildContext context) =>
      BlocProvider.of<ProfileViewmodel>(context);
  void logout() async {
    emit(state.copyWith(isLogoutLoading: true));
    var result = await userRepo.logout();
    result.when(
      success: (loggedOut) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutSuccess: loggedOut,
          ),
        );
      },
      failure: (failure) {
        emit(
          state.copyWith(
            isLogoutLoading: false,
            isLogoutError: true,
            error: failure.message,
          ),
        );
      },
    );
  }
}
