import 'package:bmi_tracker/repositories/auth_repository/auth_repo_impl.dart';
import 'package:bmi_tracker/repositories/auth_repository/auth_repo_interface.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_impl.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthRepoInterface>(
    AuthRepoImpl(),
  );
  locator.registerSingleton<UserRepoInterface>(
    UserRepoImpl(),
  );
}

final kAuthRepo = locator<AuthRepoInterface>();
final kUserRepo = locator<UserRepoInterface>();
