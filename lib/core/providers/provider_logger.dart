// A Counter example implemented with riverpod with Logger

import 'dart:developer';

import 'package:riverpod/riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''----------------------------------------
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
} ---------------------------------------- ''');
  }
}
