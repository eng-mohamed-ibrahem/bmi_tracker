import 'package:bmi_tracker/core/constant/firebase_constants.dart';
import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/repositories/bmi_repository/bmi_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiRepoImpl implements BmiRepoInterface {
  @override
  Future<ResultHandler<List<BmiModel>, ServerFailure>> fetchEntriesPerPage({
    required int entriesPerPage,
    DocumentSnapshot? lastDocumentSnapshot,
  }) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var query = FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .orderBy(FirebaseConstants.timeKey, descending: true)
            .limit(entriesPerPage);
        QuerySnapshot<Map<String, dynamic>> snapshot;
        if (lastDocumentSnapshot == null) {
          snapshot = await query.get();
          lastDocumentSnapshot = snapshot.docs.last;
        } else {
          snapshot = await query.startAfterDocument(lastDocumentSnapshot).get();
          lastDocumentSnapshot = snapshot.docs.last;
        }
        return ResultHandler.success(
          data: snapshot.docs
              .map<BmiModel>(
                (e) => BmiModel.fromJson(e.data()),
              )
              .toList(),
        );
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<
      ResultHandler<Stream<QuerySnapshot<Map<String, dynamic>>>,
          ServerFailure>> getBmiStream({required int limitQuery}) async {
    try {
      return ResultHandler.success(
        data: FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .orderBy(FirebaseConstants.timeKey, descending: true)
            .limit(limitQuery)
            .snapshots(),
      );
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
