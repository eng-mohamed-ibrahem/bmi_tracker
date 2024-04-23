import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BmiRepoInterface {
  Future<ResultHandler<List<BmiModel>, ServerFailure>> fetchEntriesPerPage({
    required int entriesPerPage,
    DocumentSnapshot? lastDocumentSnapshot,
  });

  Future<
      ResultHandler<Stream<QuerySnapshot<Map<String, dynamic>>>,
          ServerFailure>> getBmiStream({required int limitQuery});
}
