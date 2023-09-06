import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:towfix_service/core/dao/data_source/auth_repository.dart';
import 'package:towfix_service/core/dto/failure/failure.dart';

import '../application/cache/cache_service.dart';
import '../dao/data_source/store_repository.dart';
import '../dto/service_request/service_request.dart';

part 'common.g.dart';

/// firestore provider
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

/// firebase auth provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

///Authrepository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(firebaseAuthProvider));
});

/// Database repository provider
final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) {
  return FirestoreDatabaseRepositoryImpl(
      firestore: ref.read(firestoreProvider),
      firebaseStorage: ref.read(firebaseStorageProvider));
});

// cache service provider
final cacheServiceProvider = Provider<CacheService>((ref) {
  return HiveCacheServiceImpl();
});

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});

/// login state provider
final loginStateProvider = StateProvider<bool>((ref) {
  return false;
});

@riverpod
Stream<Either<Failure, List<ServiceRequest>>> serviceRequest(Ref ref) async* {
  final dbRepo = ref.watch(databaseRepositoryProvider);

  final result = dbRepo.getServiceRequests();

  yield* result;
}

 


// final hasOnboardedShopProvider = StateProvider<bool>((ref) {
//   final shopFutr = ref.read(shopProvider);
//   var hasOnboarded;
//   // shopFutr.whenData((shopResult) {
//   //   shopResult.fold<bool>((l) {
//   //     hasOnboarded = false;
//   //     return hasOnboarded!;
//   //   }, (r) {
//   //     if (r == Shop.initial()) {
//   //       hasOnboarded = false;
//   //       return hasOnboarded!;
//   //     }
//   //     hasOnboarded = true;
//   //     return hasOnboarded!;
//   //   });
//   // });

//   Future(() async {
//     final result = await ref
//         .read(databaseRepositoryProvider)
//         .getShopByProfileId(ref.watch(firebaseAuthProvider).currentUser!.uid);

//     result.fold((l) {
//       hasOnboarded = false;
//     }, (r) {
//       if (r == Shop.initial()) {
//         hasOnboarded = false;
//       }
//       hasOnboarded = true;
//     });
//   });

//   return hasOnboarded;
// });
