import 'package:bmi_tracker/core/constant/firebase_constants.dart';
import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl implements UserRepoInterface {
  @override
  Future<ResultHandler<bool, ServerFailure>> logout() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        await FirebaseAuth.instance.signOut();
        return const ResultHandler.success(data: true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> uploadMbi({
    required double height,
    required double weight,
    required double mbi,
    required int age,
  }) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        BmiModel newBmi = BmiModel(
          height: height,
          weight: weight,
          age: age,
          bmiResult: mbi,
          time: DateTime.now(),
        );
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .add(
              newBmi.toJson(),
            );
        return const ResultHandler.success(data: true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure(
                'No internet connection to upload, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> isOnline() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        return ResultHandler.success(
            data: FirebaseAuth.instance.currentUser == null ? false : true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

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
}
