import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/constant/app_metrices.dart';
import 'package:bmi_tracker/core/utils/dialog/helper_dialog.dart';
import 'package:bmi_tracker/core/utils/snackbar/handler_snackbar.dart';
import 'package:bmi_tracker/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewmodel, ProfileViewmodelState>(
      listener: (context, state) {
        if (state.isLogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, GenerateRouter.splash, (route) => false);
        }
        if (state.isLogoutError) {
          showSnackbar(context, message: state.error!);
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: !state.isLogoutLoading,
          onPopInvoked: (didPop) {
            if (!didPop) {
              showSnackbar(context, message: 'Please wait...');
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You signed in as: Anonymous',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: AppMetrices.heightSpace2),
                ElevatedButton(
                  onPressed: state.isLogoutLoading
                      ? null
                      : () {
                          showLogoutDialog(
                            context,
                            () {
                              Navigator.pop(context);
                              ProfileViewmodel.get(context).logout();
                            },
                          );
                        },
                  child: state.isLogoutLoading
                      ? const CircularProgressIndicator()
                      : const Text('Logout'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
