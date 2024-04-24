import 'package:bmi_tracker/core/constant/firebase_constants.dart';
import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/repositories/bmi_repository/bmi_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiRepoImpl implements BmiRepoInterface {
  @override
  Future<
      ResultHandler<Stream<QuerySnapshot<Map<String, dynamic>>>,
          ServerFailure>> getBmiStream({required int limitQuery}) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        return ResultHandler.success(
          data: FirebaseFirestore.instance
              .collection(FirebaseConstants.usersCollection)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection(FirebaseConstants.bmiEntries)
              .orderBy(FirebaseConstants.timeKey, descending: true)
              .limit(limitQuery)
              .snapshots(),
        );
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> areThereMoreEntries(
      {required DocumentSnapshot docRef}) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        bool areThereMore = await FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .orderBy(FirebaseConstants.timeKey, descending: true)
            .startAfterDocument(docRef)
            .get()
            .then((value) => value.size > 0);

        return ResultHandler.success(data: areThereMore);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
