import 'dart:developer';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../core/dto/failure/failure.dart';

abstract class AppUser {
  String get uid;
  String? get email;
  bool get emailVerified;
  String? get displayName;
  String? get photoURL;
  String? get phoneNumber;
  bool get isAnonymous;
  bool get isEmailVerified;

  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, void>> updateDisplayName(String displayName);

  Future<Either<Failure, void>> reload();

  Future<Either<Failure, void>> updatePhotoURL(String photoURL);

  Future<Either<Failure, void>> updateEmail(String email);

  Future<Either<Failure, void>> updatePassword(String password);

  Future<Either<Failure, void>> updatePhoneNumber(String phoneNumber);

  Future<Either<Failure, void>> delete();

  Future<Either<Failure, void>> linkWithPhoneNumber(String phoneNumber);
}

///*

class FirebaseAppUser implements AppUser {
  const FirebaseAppUser(this._user);
  final User _user;

  @override
  String get uid => _user.uid;

  @override
  String? get email => _user.email;

  @override
  bool get emailVerified => _user.emailVerified;

  @override
  String? get displayName => _user.displayName;

  @override
  String? get photoURL => _user.photoURL;

  @override
  String? get phoneNumber => _user.phoneNumber;

  @override
  bool get isAnonymous => _user.isAnonymous;

  @override
  bool get isEmailVerified => _user.emailVerified;

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      _user.sendEmailVerification();
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'SENDEMAILVERIFICATION');
      return Left(Failure.exception(message: '${e}'));
    }
  }

  @override
  Future<Either<Failure, void>> reload() async {
    try {
      _user.reload();
      return Right(Void);
    } catch (e) {
      log('$e', name: 'RELOAD', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDisplayName(String displayName) async {
    try {
      _user.updateDisplayName(displayName);
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'UPDATEDISPLAYNAME', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateEmail(String email) async {
    try {
      _user.updateEmail(email);
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'UPDATEEMAIL', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String password) async {
    try {
      _user.updatePassword(password);
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'UPDATEPASSWORD', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePhoneNumber(String phoneNumber) async {
    try {
      _user.updatePhoneNumber(
          PhoneAuthProvider.credential(verificationId: '', smsCode: ''));
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'UPDATEPHONENUMBER', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePhotoURL(String photoURL) async {
    try {
      _user.updatePhotoURL(photoURL);
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'UPDATEPHOTOURL', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> delete() async {
    try {
      _user.delete();
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'DELETE', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, void>> linkWithPhoneNumber(String phoneNumber) async {
    try {
      _user.linkWithPhoneNumber(phoneNumber);
      return const Right(Void);
    } catch (e) {
      log('$e', name: 'linkWithPhoneNumber', error: e);
      return Left(Failure.exception(message: '$e'));
    }
  }
}
