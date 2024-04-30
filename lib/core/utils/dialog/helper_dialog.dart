import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/view/widgets/input_field/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

showLogoutDialog(BuildContext context, void Function() onLogout) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text(
          'Your Data will be lost. and cannot be recovered.\n Are you sure you want to logout?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onLogout,
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

// show dialog of delete bmi item
showDeleteDialog(BuildContext context, {required void Function() onDelete}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete'),
        content: const Text(
          'Are you sure you want to delete this entry?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onDelete,
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      );
    },
  );
}

// show dialog for editting bmi item
Future<({String height, String weight})?> showEditDialog(
  BuildContext context, {
  void Function()? onEdit,
}) async {
  return await showDialog<({String height, String weight})?>(
    context: context,
    builder: (context) {
      var hight = '0';
      var weight = '0';
      return AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.all(5),
        title: const Text('Edit'),
        content: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text('height',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
                Expanded(
                  flex: 5,
                  child: InputField(
                    onChanged: (value) {
                      hight = value;
                    },
                    validator: (value) {
                      if (value!.isNotEmpty && double.parse(value) > 300) {
                        return 'Please enter a valid height';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[0-9.]{0,5}')),
                    ],
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
                  flex: 2,
                  child: Text('weight',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
                Expanded(
                  flex: 5,
                  child: InputField(
                    onChanged: (value) {
                      weight = value;
                    },
                    validator: (value) {
                      if (value!.isNotEmpty && double.parse(value) > 300) {
                        return 'Please enter a valid weight';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[0-9.]{0,6}')),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: AppMetrices.heightSpace,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onEdit?.call();
              Navigator.pop(
                context,
                (
                  height: hight.isEmpty ? '0' : hight,
                  weight: weight.isEmpty ? '0' : weight
                ),
              );
            },
            child: const Text(
              'Edit',
            ),
          )
        ],
      );
    },
  );
}
