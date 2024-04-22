import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/utils/dependency_locator/dependency_locator.dart';
import 'package:bmi_tracker/core/utils/snackbar/handler_snackbar.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        kUserRepo.isOnline().then(
          (result) {
            result.when(
              success: (isOnline) {
                if (isOnline) {
                  Navigator.of(context)
                      .pushReplacementNamed(GenerateRouter.home);
                } else {
                  Navigator.of(context)
                      .pushReplacementNamed(GenerateRouter.auth);
                }
              },
              failure: (failure) {
                showSnackbar(context, message: failure.message);
              },
            );
          },
        );
      },
    );
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text('Loading...'),
        ],
      ),
    );
  }
}
