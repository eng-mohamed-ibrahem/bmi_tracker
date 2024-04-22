import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';

abstract class UserRepoInterface {
  Future<ResultHandler<bool, ServerFailure>> logout();
  Future<ResultHandler<bool, ServerFailure>> isOnline();
  Future<ResultHandler<bool, ServerFailure>> uploadMbi({
    required double height,
    required double weight,
    required double mbi,
    required int age,
  });
}
