import 'package:bmi_tracker/config/generate_router.dart';
import 'package:bmi_tracker/core/utils/dependency_locator/dependency_locator.dart';
import 'package:bmi_tracker/viewmodel/auth_viewmodel/auth_viewmodel.dart';
import 'package:bmi_tracker/viewmodel/bmi_entries_viewmodel/bmi_entries_viewmodel.dart';
import 'package:bmi_tracker/viewmodel/bmi_submit_viewmodel/bmi_submit_viewmodel.dart';
import 'package:bmi_tracker/viewmodel/profile_viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthViewmodel>(
          create: (context) => AuthViewmodel(authRepo: kAuthRepo),
        ),
        BlocProvider<BmiSubmitViewmodel>(
          create: (context) => BmiSubmitViewmodel(userRepo: kUserRepo),
        ),
        BlocProvider<BmiEntriesViewmodel>(
          create: (context) => BmiEntriesViewmodel(),
        ),
        BlocProvider<ProfileViewmodelCubit>(
          create: (context) => ProfileViewmodelCubit(),
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
