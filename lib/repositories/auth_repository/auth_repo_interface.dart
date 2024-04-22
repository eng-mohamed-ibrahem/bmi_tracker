import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';

abstract class AuthRepoInterface {
  Future<ResultHandler<String, ServerFailure>> signinAnonymously();
}
