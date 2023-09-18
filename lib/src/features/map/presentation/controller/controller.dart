import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:towfix_service/core/dto/failure/failure.dart';
import 'package:towfix_service/core/dto/service_request/service_request.dart';
import 'package:towfix_service/core/providers/common.dart';

part 'controller.g.dart';

@riverpod
Stream<Either<Failure, ServiceRequest>> serviceRequest(
    ServiceRequestRef ref, String id) {
  return ref.watch(databaseRepositoryProvider).getServiceRequestDetails(id);
}
