import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/core/utils/internet_connection/internet_connection.dart';
import 'package:bmi_tracker/repositories/auth_repository/auth_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepoInterface {
  @override
  Future<ResultHandler<String, ServerFailure>> signinAnonymously() async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
        var userCredential = await FirebaseAuth.instance.signInAnonymously();
        return ResultHandler.success(data: userCredential.user!.uid);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
