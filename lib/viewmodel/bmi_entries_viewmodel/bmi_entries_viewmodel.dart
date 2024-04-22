import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bmi_entries_viewmodel_state.dart';
part 'bmi_entries_viewmodel.freezed.dart';

class BmiEntriesViewmodel extends Cubit<BmiEntriesViewmodelState> {
  BmiEntriesViewmodel() : super(const BmiEntriesViewmodelState());

  static BmiEntriesViewmodel get(BuildContext context) =>
      BlocProvider.of<BmiEntriesViewmodel>(context);
}
