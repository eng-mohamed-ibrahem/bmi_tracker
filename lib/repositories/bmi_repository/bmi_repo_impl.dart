import 'package:bmi_tracker/core/constant/firebase_constants.dart';
import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/core/utils/internet_connection/internet_connection.dart';
import 'package:bmi_tracker/repositories/bmi_repository/bmi_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiRepoImpl implements BmiRepoInterface {
  @override
  Future<
      ResultHandler<Stream<QuerySnapshot<Map<String, dynamic>>>,
          ServerFailure>> getBmiStream({
    required int limitQuery,
    DocumentSnapshot? docRef,
  }) async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
        var query = FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .orderBy(FirebaseConstants.timeKey, descending: true)
            .limit(limitQuery);
        if (docRef != null) {
          query = query.startAfterDocument(docRef);
        }
        return ResultHandler.success(
          data: query.snapshots(),
        );
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
