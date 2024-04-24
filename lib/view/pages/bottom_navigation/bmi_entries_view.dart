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
        if (state.isStreamInitialized == false) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: state.bmiStream,
                builder: (context, snapshot) {
                  List<BmiModel> entries = [];

                  /// get the previous data stream if loading for second time
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
                    context.read<BmiEntriesViewmodel>().setLastDocumentSnapshot(
                        lastDocumentSnapshot: snapshot.data!.docs.last);
                  }
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
                                  await showEditDialog(context, onEdit: () {})
                                      .then(
                                    (updatedData) {
                                      if (updatedData != null) {
                                        var weight = updatedData.weight.isEmpty
                                            ? entries[index].weight
                                            : double.parse(updatedData.weight);
                                        var height = updatedData.height.isEmpty
                                            ? entries[index].height
                                            : double.parse(
                                                updatedData.height,
                                              );
                                        context
                                            .read<BmiEntriesViewmodel>()
                                            .updateBmiEntry(
                                              bmiEntryReference: snapshot.data!
                                                  .docs[index].reference.id,
                                              bmiModel: entries[index],
                                              height: height,
                                              weight: weight,
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
                                              bmiEntryReference: snapshot.data!
                                                  .docs[index].reference.id);
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
                },
              ),
            ),
            // if (state.loadNextPage)
            //   const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
