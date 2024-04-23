import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';

abstract class UserRepoInterface {
  Future<ResultHandler<bool, ServerFailure>> logout();
  Future<ResultHandler<bool, ServerFailure>> isOnline();
  Future<ResultHandler<bool, ServerFailure>> uploadMbi({
    required BmiModel bmiModel,
  });
}
