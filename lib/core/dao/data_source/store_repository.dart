import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';

import 'package:towfix_service/core/dto/failure/failure.dart';
import 'package:towfix_service/core/dto/profile/profile.dart';
import 'package:towfix_service/core/dto/service_request/service_request.dart';

abstract class DatabaseRepository {
  //* retrieve logged users profile
  Future<Either<Failure, Profile>> retrieveProfile(String id);

  //* save user to remote database
  Future<Either<Failure, Profile>> saveProfile(Profile profile);

  //* update user
  Future<Either<Failure, Profile>> updateProfile(Profile profile);

  /// * upoad image to firebase
  Future<Either<Failure, String>> uploadImage(String path);

  ///* get service requests
  Stream<Either<Failure, List<ServiceRequest>>> getServiceRequests();

  //* get request details
  // [id] used to fetch request details
  //[getServiceRequestDetails] gets details on a particular service
  Stream<Either<Failure, ServiceRequest>> getServiceRequestDetails(String id);
}

class FirestoreDatabaseRepositoryImpl implements DatabaseRepository {
  const FirestoreDatabaseRepositoryImpl(
      {required this.firestore, required this.firebaseStorage});

  final FirebaseFirestore firestore;

  final FirebaseStorage firebaseStorage;

  final profileCollectionPath = 'profiles';
  final serviceRequestCollectionPath = 'service-request';

  @override
  Future<Either<Failure, Profile>> retrieveProfile(String id) async {
    try {
      final result =
          await firestore.collection(profileCollectionPath).doc(id).get();
      return Right(Profile.fromJson(result.data()!));
    } on FirebaseException catch (e) {
      log('$e', error: e, name: 'RETRIEVEPROFILE Firebase EXCEPTION');

      return const Left(
          Failure.exception(message: 'Error retrieving profile info'));
    } catch (e) {
      log('$e', error: e, name: 'RETRIEVEPROFILE');

      return const Left(
          Failure.exception(message: 'Error retrieving profile info'));
    }
  }

  @override
  Future<Either<Failure, Profile>> saveProfile(Profile profile) async {
    try {
      final date = {'date': FieldValue.serverTimestamp()};

      await firestore
          .collection(profileCollectionPath)
          .doc(profile.id)
          .set(profile.toJson()..addAll(date));
      return Right(Profile.fromJson(profile.toJson()..addAll(date)));
    } on FirebaseException catch (e) {
      log('$e', error: e, name: 'SAVEPROFILE Firebase EXCEPTION');

      return const Left(
          Failure.exception(message: 'Error retrieving profile info'));
    } catch (e) {
      log('$e', error: e, name: 'SAVEPROFILE');

      return const Left(
          Failure.exception(message: 'Error SAVEPROFILE profile info'));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      await firestore
          .collection(profileCollectionPath)
          .doc(profile.id)
          .update(profile.toJson());
      return Right(Profile.fromJson(profile.toJson()));
    } on FirebaseException catch (e) {
      log('$e', error: e, name: 'updateProfile Firebase EXCEPTION');

      return const Left(
          Failure.exception(message: 'Error retrieving profile info'));
    } catch (e) {
      log('$e', error: e, name: 'updateProfile');

      return const Left(
          Failure.exception(message: 'Error updateProfile profile info'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(String path) async {
    try {
      File file = File(path);
      final breaks = path.split('/');
      final filename = breaks.last;
      final uploadTask =
          await firebaseStorage.ref().child(filename).putFile(file);

      log('UPLOAD TASK: $uploadTask');
      log('------------------\nUPLOAD TASK Files transfered: ${uploadTask.bytesTransferred}/${uploadTask.totalBytes}');
      final result = await uploadTask.ref.getDownloadURL();
      return Right(result);
    } on firebase_core.FirebaseException catch (e) {
      return Left(Failure.exception(
          message: e.message ?? 'Ooops, something went wrong.'));
    } catch (e) {
      return const Left(
          Failure.exception(message: 'Ooops, something went wrong.'));
    }
  }

  @override
  Stream<Either<Failure, ServiceRequest>> getServiceRequestDetails(String id) {
    // TODO: implement getServiceRequestDetails
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<ServiceRequest>>> getServiceRequests() async* {
    try {
      // todo: get all request
      final result = await firestore
          .collection(serviceRequestCollectionPath)
          // .where('status', isEqualTo: RequestStatus.active)
          .doc()
          .snapshots()
          .map((event) => ServiceRequest.fromJson(event.data()!))
          .toList();
      //todo: sort by proximity radius

      //todo: return requests in proximity

      yield Right(result);
    } on FirebaseException catch (e) {
      log('$e', error: e, name: 'updateProfile Firebase EXCEPTION');

      yield const Left(
          Failure.exception(message: 'Error retrieving profile info'));
    } catch (e) {
      log('$e', error: e, name: 'getServiceRequestDetails');

      yield const Left(
          Failure.exception(message: 'Error getServiceRequestDetails  info'));
    }
  }
}
