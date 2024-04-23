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
showEditDialog(
  BuildContext context, {
  required TextEditingController hightController,
  required TextEditingController weightController,
  required void Function() onEdit,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
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
                    controller: hightController,
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
                    controller: weightController,
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
              onEdit.call();
              hightController.dispose();
              weightController.dispose();
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
