import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/viewmodel/auth_viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to BMI Tracker',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: AppMetrices.heightSpace),
            const Text(
              'Please Sign in to save your data in the cloud',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppMetrices.heightSpace3),
            BlocConsumer<AuthViewmodel, AuthViewModelState>(
              listener: (context, state) {
                if (state.isSinginSuccess) {
                  Navigator.of(context)
                      .pushReplacementNamed(GenerateRouter.home);
                }
              },
              builder: (context, state) {
                if (state.isSigninLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  onPressed: () async {
                    AuthViewmodel.get(context).signinAnonymously();
                  },
                  child: const Text('Sign in Anonymously'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}