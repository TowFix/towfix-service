import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String status,
    required String message,
  }) = Server;

  const factory Failure.cache({
    required String message,
  }) = Cache;

  const factory Failure.network({
    required String message,
  }) = Network;

  const factory Failure.exception({
    required String message,
  }) = FException;
}
