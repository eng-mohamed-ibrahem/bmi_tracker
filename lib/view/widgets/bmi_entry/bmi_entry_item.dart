import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiEntryItem extends StatelessWidget {
  const BmiEntryItem({super.key, required this.bmiModel});
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  color: Colors.grey[100], child: Text('${bmiModel.height}')),
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
                  color: Colors.grey[100], child: Text('${bmiModel.weight}')),
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
                child: Text('${bmiModel.bmiResult}'),
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
                  color: Colors.grey[100], child: Text('${bmiModel.age}')),
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
                      .format(bmiModel.time)),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppMetrices.heightSpace,
        )
      ],
    );
  }
}
