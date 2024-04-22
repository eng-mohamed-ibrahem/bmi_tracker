import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/utils/dependency_locator/dependency_locator.dart';
import 'package:bmi_tracker/viewmodel/auth_viewmodel/auth_viewmodel.dart';
import 'package:bmi_tracker/viewmodel/home_viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeViewmodel>(
          create: (context) => HomeViewmodel(userRepo: kUserRepo),
        ),
        BlocProvider<AuthViewmodel>(
          create: (context) => AuthViewmodel(authRepo: kAuthRepo),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GenerateRouter.splash,
        onGenerateRoute: GenerateRouter.routeGenerator,
      ),
    );
  }
}
