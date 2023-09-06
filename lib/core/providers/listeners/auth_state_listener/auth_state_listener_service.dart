import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/core/dto/app_user/app_user.dart';

import '../../common.dart';

final onAuthStateChangedProvider = StreamProvider<AppUser?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);

  return authRepo.authStateChanges();
});

class AuthStateChangedService {
  // 1. Pass a Ref argument to the constructor
  AuthStateChangedService(this.ref) {
    // 2. Call _init as soon as the object is created
    _init();
  }
  final Ref ref;

  void _init() {
    // 3. listen to the StreamProvider
    ref.listen<AsyncValue<AppUser?>>(onAuthStateChangedProvider,
        (previous, next) {
      log('prev: $previous, next: $next', name: 'AUTHSTATECHANGES');
      log('next: ${next?.value}', name: 'AUTHSTATECHANGES');

      ref.read(loginStateProvider.notifier).state = next.value != null;
      // 4. Implement the event handling code
    });
  }
}

// auth statechanged service provider
final authStateChangedServiceProvider =
    Provider<AuthStateChangedService>((ref) {
  return AuthStateChangedService(ref);
});
