import 'dart:developer';

import 'package:bmi_tracker/core/utils/dialog/helper_dialog.dart';
import 'package:bmi_tracker/core/utils/snackbar/handler_snackbar.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/view/widgets/bmi_entry/bmi_entry_item.dart';
import 'package:bmi_tracker/viewmodel/bmi_entries_viewmodel/bmi_entries_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMIEntries extends StatefulWidget {
  const BMIEntries({super.key});

  @override
  State<BMIEntries> createState() => _BMIEntriesState();
}

class _BMIEntriesState extends State<BMIEntries> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    log('===================initState====================');
    super.initState();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent) {
        context.read<BmiEntriesViewmodel>().bmiStream();
      }
    });
    context.read<BmiEntriesViewmodel>().bmiStream();
  }

  @override
  void dispose() {
    controller.dispose();
    log('===================dispose====================');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiEntriesViewmodel, BmiEntriesViewmodelState>(
      listener: (context, state) {
        if (state.isStreamError) {
          showSnackbar(context, message: state.error!);
        }
        if (state.isBmiEntryUpdatededError) {
          showSnackbar(context, message: state.error!);
        }
        if (state.isBmiEntryUpdated) {
          showSnackbar(context, message: 'Entry updated successfully');
        }
        if (state.isBmiEntryUpdating) {
          showSnackbar(context, message: 'Entry updating...');
        }
        if (state.isBmiEntryDeleted) {
          showSnackbar(context, message: 'Entry deleted successfully');
        }
        if (state.isBmiEntryDeleting) {
          showSnackbar(context, message: 'Entry deleting...');
        }
      },
      builder: (context, state) {
        log('===================builder====================');
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: state.bmiStreamController.stream,
          builder: (context, snapshot) {
            log('===================bmiStream====================\n${snapshot.connectionState}');

            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.hasData) {
              List<BmiModel> entries = snapshot.data!.docs
                  .map<BmiModel>(
                    (e) => BmiModel.fromJson(e.data()),
                  )
                  .toList();

              return entries.isEmpty
                  ? const Center(child: Text('No entries yet'))
                  : ListView.separated(
                      controller: controller,
                      itemCount: entries.length + 1,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < entries.length) {
                          return BmiEntryItem(
                            bmiModel: entries[index],
                            onEdit: () async {
                              await showEditDialog(context, onEdit: () {}).then(
                                (updatedData) {
                                  if (updatedData != null) {
                                    context
                                        .read<BmiEntriesViewmodel>()
                                        .updateBmiEntry(
                                          bmiEntryReference: snapshot
                                              .data!.docs[index].reference.id,
                                          bmiModel: entries[index],
                                          height: double.parse(
                                            updatedData.height,
                                          ),
                                          weight: double.parse(
                                            updatedData.weight,
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                            onDelete: () {
                              showDeleteDialog(
                                context,
                                onDelete: () {
                                  context
                                      .read<BmiEntriesViewmodel>()
                                      .deleteBmiEntry(
                                          bmiEntryReference: snapshot
                                              .data!.docs[index].reference.id);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        } else {
                          if (state.loadNextPage) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return const SizedBox();
                          }
                        }
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
