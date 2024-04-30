import 'package:bmi_tracker/core/constant/firebase_constants.dart';
import 'package:bmi_tracker/core/error/failure.dart';
import 'package:bmi_tracker/core/handle_result/result.dart';
import 'package:bmi_tracker/core/utils/internet_connection/internet_connection.dart';
import 'package:bmi_tracker/model/bmi_model/bmi_model.dart';
import 'package:bmi_tracker/repositories/user_repository/user_repo_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl implements UserRepoInterface {
  @override
  Future<ResultHandler<bool, ServerFailure>> logout() async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
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
    required BmiModel bmiModel,
  }) async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .add(
              bmiModel.toJson(),
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
      var connected = await InternetConnection.isConnected();
      if (connected) {
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
  Future<ResultHandler<BmiModel, ServerFailure>> updateBmiEntry({
    required String bmiEntryReference,
    required BmiModel updatedBmiModel,
  }) async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .doc(bmiEntryReference)
            .update(updatedBmiModel.toJson());
        return ResultHandler.success(data: updatedBmiModel);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ServerFailure>> deleteBmiEntry(
      {required String bmiEntryReference}) async {
    try {
      var connected = await InternetConnection.isConnected();
      if (connected) {
        await FirebaseFirestore.instance
            .collection(FirebaseConstants.usersCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection(FirebaseConstants.bmiEntries)
            .doc(bmiEntryReference)
            .delete();
        return const ResultHandler.success(data: true);
      } else {
        return ResultHandler.failure(
            error: ServerFailure('No internet connection, please try again'));
      }
    } catch (e) {
      return ResultHandler.failure(error: ServerFailure(e.toString()));
    }
  }
}
