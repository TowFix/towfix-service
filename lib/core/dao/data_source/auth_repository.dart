import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:towfix_service/core/dto/app_user/app_user.dart';

import '../../../core/dto/failure/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword(
      String email, String password);

  /// create
  Future<Either<Failure, AppUser>> createUserWithEmailAndPassword(
      String email, String password);

  // sign up with email

  Stream<AppUser?> authStateChanges();

  AppUser? get currentUser;

  Future<Either<Failure, void>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().map(_convertUser);
  }

  @override
  AppUser? get currentUser => _convertUser(_auth.currentUser);

  /// Helper method to convert a [User] to an [AppUser]
  AppUser? _convertUser(User? user) =>
      user != null ? FirebaseAppUser(user) : null;

  @override
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return Right(_convertUser(result.user)!);

      // return const Left(
      //     Failure.server(status: '404', message: 'Something went wrong'));
    } catch (e) {
      log('$e', name: 'SIGNINWITHEMAIL', error: e);
      return const Left(Failure.exception(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, AppUser>> createUserWithEmailAndPassword(
      String email, String password) async {
    log('starting createUserWithEmailAndPassword',
        name: 'createUserWithEmailAndPassword');
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return Right(_convertUser(result.user)!);

      // return const Left(
      //     Failure.server(status: '404', message: 'Something went wrong'));
    } catch (e) {
      log('$e', name: 'createUserWithEmailAndPassword', error: e);
      return const Left(Failure.exception(message: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await _auth.signOut();

      return Right(null);

      // return const Left(
      //     Failure.server(status: '404', message: 'Something went wrong'));
    } catch (e) {
      log('$e', name: 'signOut', error: e);
      return const Left(Failure.exception(message: 'Something went wrong'));
    }
  }
}
