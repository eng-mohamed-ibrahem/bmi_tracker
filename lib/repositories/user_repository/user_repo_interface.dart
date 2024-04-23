import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRepoInterface {
  Future<ResultHandler<bool, ServerFailure>> logout();
  Future<ResultHandler<bool, ServerFailure>> isOnline();
  Future<ResultHandler<bool, ServerFailure>> uploadMbi({
    required double height,
    required double weight,
    required double mbi,
    required int age,
  });

  Future<ResultHandler<List<BmiModel>, ServerFailure>> fetchEntriesPerPage({
    required int entriesPerPage,
    DocumentSnapshot? lastDocumentSnapshot,
  });
}
