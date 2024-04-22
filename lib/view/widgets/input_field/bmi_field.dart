import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/view/widgets/input_field/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMIField extends StatelessWidget {
  const BMIField({
    super.key,
    required this.title,
    required this.controller,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.textInputAction,
  });
  final String title;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
          ),
        ),
        const SizedBox(
          width: AppMetrices.widthSpace,
        ),
        Expanded(
          flex: 4,
          child: InputField(
            keyboardType: TextInputType.number,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            controller: controller,
            validator: validator,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
