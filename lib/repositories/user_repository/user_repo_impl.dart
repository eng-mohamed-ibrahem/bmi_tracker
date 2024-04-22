import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl implements UserRepoInterface {
  @override
  Future<ResultHandler<bool, ServerFailure>> logout() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        await FirebaseAuth.instance.signOut();
        return const ResultHandler.success(data: true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> uploadMbi(String mbi) {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> isOnline() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        return ResultHandler.success(
            data: FirebaseAuth.instance.currentUser == null ? false : true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
