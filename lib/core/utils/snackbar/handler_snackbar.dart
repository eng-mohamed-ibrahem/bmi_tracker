import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center,),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
