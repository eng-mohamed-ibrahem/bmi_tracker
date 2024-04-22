import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_viewmodel.freezed.dart';
part 'profile_viewmodel_state.dart';

class ProfileViewmodelCubit extends Cubit<ProfileViewmodelState> {
  ProfileViewmodelCubit() : super(const ProfileViewmodelState());
}
