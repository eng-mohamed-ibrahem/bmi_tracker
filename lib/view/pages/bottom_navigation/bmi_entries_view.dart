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
    super.initState();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent) {
        context.read<BmiEntriesViewmodel>().bmiStream(loadNextPage: true);
      }
    });
    context.read<BmiEntriesViewmodel>().bmiStream();
  }

  var loadNextPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiEntriesViewmodel, BmiEntriesViewmodelState>(
      listener: (context, state) {
        if (state.isStreamError) {
          showSnackbar(context, message: state.error!);
        }
      },
      builder: (context, state) {
        if (state.isStreamInitialized == false) {
          return const Center(child: CircularProgressIndicator());
        }
        log('loadNextPage = ${state.loadNextPage}');
        return Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: state.bmiStream,
                builder: (context, snapshot) {
                  List<BmiModel> entries = [];

                  // get the previous data stream if loading for second time
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      snapshot.hasData) {
                    entries = snapshot.requireData.docs
                        .map<BmiModel>(
                          (e) => BmiModel.fromJson(e.data()),
                        )
                        .toList();
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    entries = snapshot.data!.docs
                        .map<BmiModel>(
                          (e) => BmiModel.fromJson(e.data()),
                        )
                        .toList();
                    loadNextPage = false;
                  }
                  return entries.isEmpty
                      ? const Center(child: Text('No entries yet'))
                      : ListView.separated(
                          controller: controller,
                          itemCount: entries.length,
                          itemBuilder: (context, index) {
                            return BmiEntryItem(
                              bmiModel: entries[index],
                              onEdit: () {
                                var hightController = TextEditingController();
                                var weightController = TextEditingController();
                                showEditDialog(context,
                                    hightController: hightController,
                                    weightController: weightController,
                                    onEdit: () {
                                  var weight = weightController.text.isEmpty
                                      ? entries[index].weight
                                      : double.parse(
                                          weightController.text,
                                        );
                                  var height = hightController.text.isEmpty
                                      ? entries[index].height
                                      : double.parse(
                                          hightController.text,
                                        );
                                  var newEntry = entries[index].copyWith(
                                    height: height,
                                    weight: weight,
                                    bmiResult: hightController.text.isEmpty &&
                                            weightController.text.isEmpty
                                        ? entries[index].bmiResult
                                        : double.parse(
                                            (weight / (height * height / 10000))
                                                .toStringAsFixed(2),
                                          ),
                                  );
                                  snapshot.data!.docs[index].reference
                                      .update(newEntry.toJson());
                                  Navigator.pop(context);
                                });
                              },
                              onDelete: () {
                                showDeleteDialog(
                                  context,
                                  onDelete: () {
                                    snapshot.data!.docs[index].reference
                                        .delete();
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        );
                },
              ),
            ),
            if (state.loadNextPage)
              const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
