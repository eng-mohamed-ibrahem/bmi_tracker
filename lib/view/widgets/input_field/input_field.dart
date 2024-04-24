import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
  });
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppMetrices.widthSpace2,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          iconColor: Theme.of(context).iconTheme.color,
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
