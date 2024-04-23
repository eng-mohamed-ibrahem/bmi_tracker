import 'package:bmi_tracker/view/widgets/bmi_entry/bmi_entry_item.dart';
import 'package:bmi_tracker/viewmodel/bmi_entries_viewmodel/bmi_entries_viewmodel.dart';
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
    // todo fetch all entries from last index
    context.read<BmiEntriesViewmodel>().getEntries();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiEntriesViewmodel, BmiEntriesViewmodelState>(
      builder: (context, state) {
        if (state.isEntriesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          controller: controller,
          itemCount: state.allEntries.length,
          itemBuilder: (context, index) {
            return BmiEntryItem(
              bmiModel: state.allEntries[index],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        );
      },
    );
  }
}
