import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiEntryItem extends StatefulWidget {
  const BmiEntryItem(
      {super.key,
      required this.bmiModel,
      required this.onEdit,
      required this.onDelete});
  final BmiModel bmiModel;
  final void Function() onEdit;
  final void Function() onDelete;

  @override
  State<BmiEntryItem> createState() => _BmiEntryItemState();
}

class _BmiEntryItemState extends State<BmiEntryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: widget.onEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('height',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey[100],
                  child: Text('${widget.bmiModel.height}')),
            )
          ],
        ),
        const SizedBox(
          height: AppMetrices.heightSpace,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('weight',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey[100],
                  child: Text('${widget.bmiModel.weight}')),
            )
          ],
        ),
        const SizedBox(
          height: AppMetrices.heightSpace,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                'bmi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey[100],
                child: Text('${widget.bmiModel.bmiResult}'),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppMetrices.heightSpace,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text('age',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  color: Colors.grey[100],
                  child: Text('${widget.bmiModel.age}')),
            )
          ],
        ),
        const SizedBox(
          height: AppMetrices.heightSpace,
        ),
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                'time',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey[100],
                child: Text(
                  (DateFormat('EEEE, MMM d, yyyy – kk:mm a')
                      .format(widget.bmiModel.time)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
