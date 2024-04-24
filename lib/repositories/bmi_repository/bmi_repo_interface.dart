import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BmiRepoInterface {
  Future<
      ResultHandler<Stream<QuerySnapshot<Map<String, dynamic>>>,
          ServerFailure>> getBmiStream({required int limitQuery});

  Future<ResultHandler<bool, ServerFailure>> areThereMoreEntries(
      {required DocumentSnapshot docRef});
}
