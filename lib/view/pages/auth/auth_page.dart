import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/core/utils/snackbar/handler_snackbar.dart';
import 'package:bmi_tracker/viewmodel/auth_viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to BMI Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMetrices.widthSpace2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppMetrices.heightSpace),
            const Text(
              'Please Sign in to save your data in the cloud',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppMetrices.heightSpace),
            BlocConsumer<AuthViewmodel, AuthViewModelState>(
              listener: (context, state) {
                if (state.isSinginSuccess) {
                  showSnackbar(context, message: 'Sign in successfully');
                  Navigator.of(context)
                      .pushReplacementNamed(GenerateRouter.home);
                }
                if (state.isSinginError) {
                  showSnackbar(context, message: state.error!);
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
