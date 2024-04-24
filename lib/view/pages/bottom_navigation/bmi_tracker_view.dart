import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/core/utils/snackbar/handler_snackbar.dart';
import 'package:bmi_tracker/view/widgets/bmi_index_scale/bmi_index_scale.dart';
import 'package:bmi_tracker/view/widgets/input_field/bmi_submit_field.dart';
import 'package:bmi_tracker/viewmodel/bmi_submit_viewmodel/bmi_submit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MBITracker extends StatefulWidget {
  const MBITracker({super.key});

  @override
  State<MBITracker> createState() => _MBITrackerState();
}

class _MBITrackerState extends State<MBITracker> {
  final TextEditingController heightController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiSubmitViewmodel, BmiSubmitViewModelState>(
        listener: (context, state) {
      if (state.isBmiUploaded) {
        showSnackbar(context, message: 'BMI Uploaded successfully');
      }
      if (state.isBmiUploadedError) {
        showSnackbar(context, message: state.error!);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: AppMetrices.heightSpace2,
              ),
              const Text(
                'Enter your details below to calculate your BMI',
              ),
              const SizedBox(
                height: AppMetrices.heightSpace2,
              ),
              BMIField(
                title: 'Height',
                controller: heightController,
                suffixIcon:
                    Text('Cm', style: Theme.of(context).textTheme.bodySmall),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your height';
                  }
                  if (double.parse(value) > 300) {
                    return 'Please enter a valid height';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9.]{0,5}')),
                ],
              ),
              const SizedBox(
                height: AppMetrices.heightSpace2,
              ),
              BMIField(
                title: 'Weight',
                controller: weightController,
                suffixIcon:
                    Text('Kg', style: Theme.of(context).textTheme.bodySmall),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your weight';
                  }
                  if (double.parse(value) > 300) {
                    return 'Please enter a valid weight';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9.]{0,6}')),
                ],
              ),
              const SizedBox(
                height: AppMetrices.heightSpace2,
              ),
              BMIField(
                title: 'Age',
                controller: ageController,
                suffixIcon:
                    Text('Yrs', style: Theme.of(context).textTheme.bodySmall),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  if (int.parse(value) > 110) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}')),
                ],
              ),
              const SizedBox(
                height: AppMetrices.heightSpace3,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                child: state.isBmiCalculated
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('BMI:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: AppMetrices.widthSpace,
                              ),
                              Text(state.bmiResult!.toStringAsFixed(2),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: AppMetrices.widthSpace,
                              ),
                              state.isBmiUploading
                                  ? const Text(
                                      'Upload BMI...',
                                      style: TextStyle(color: Colors.green),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: AppMetrices.heightSpace,
                          ),
                          const BmiIndexScale(),
                        ],
                      )
                    : const SizedBox(),
              ),
              const SizedBox(
                height: AppMetrices.heightSpace,
              ),
              FilledButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<BmiSubmitViewmodel>().calculateBmi(
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          age: int.parse(ageController.text),
                        );
                  }
                },
                label: const Text('Calculate BMI'),
                icon: const Icon(Icons.calculate_outlined),
              ),
            ],
          ),
        ),
      );
    });
  }
}
