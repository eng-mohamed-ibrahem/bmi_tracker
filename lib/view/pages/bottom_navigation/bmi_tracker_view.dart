import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/view/widgets/input_field/bmi_field.dart';
import 'package:bmi_tracker/viewmodel/home_viewmodel/home_viewmodel.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppMetrices.widthSpace),
        child: BlocConsumer<HomeViewmodel, HomeViewModelState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Form(
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
                      suffixIcon: Text('Cm',
                          style: Theme.of(context).textTheme.bodySmall),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9.]{0,5}')),
                      ],
                    ),
                    const SizedBox(
                      height: AppMetrices.heightSpace2,
                    ),
                    BMIField(
                      title: 'Weight',
                      controller: weightController,
                      suffixIcon: Text('Kg',
                          style: Theme.of(context).textTheme.bodySmall),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9.]{0,6}')),
                      ],
                    ),
                    const SizedBox(
                      height: AppMetrices.heightSpace2,
                    ),
                    BMIField(
                      title: 'Age',
                      controller: ageController,
                      suffixIcon: Text('Yrs',
                          style: Theme.of(context).textTheme.bodySmall),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}')),
                      ],
                    ),
                    const SizedBox(
                      height: AppMetrices.heightSpace3,
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 400),
                      child: state.isBmiCalculated
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('BMI:'),
                                const SizedBox(
                                  width: AppMetrices.widthSpace,
                                ),
                                Text(state.bmiResult!.toStringAsFixed(2)),
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
                          context.read<HomeViewmodel>().calculateBmi(
                                height: double.parse(heightController.text),
                                weight: double.parse(weightController.text),
                              );
                          // then upload data to firebase
                        }
                      },
                      label: const Text('Calculate BMI'),
                      icon: const Icon(Icons.calculate_outlined),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
