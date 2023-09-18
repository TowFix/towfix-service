// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceRequest _$$_ServiceRequestFromJson(Map<String, dynamic> json) =>
    _$_ServiceRequest(
      id: json['id'] as String,
      requester: Profile.fromJson(json['requester'] as Map<String, dynamic>),
      servicer: Profile.fromJson(json['servicer'] as Map<String, dynamic>),
      serviceType: $enumDecode(_$ServiceTypeEnumMap, json['serviceType']),
      amount: (json['amount'] as num).toDouble(),
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']) ??
          RequestStatus.none,
      origin: Address.fromJson(json['origin'] as Map<String, dynamic>),
      destination:
          Address.fromJson(json['destination'] as Map<String, dynamic>),
      requestDate: DateTime.parse(
          JsonConverterWrapper.date(json, 'requestDate') as String),
      date: DateTime.parse(JsonConverterWrapper.date(json, 'date') as String),
    );

Map<String, dynamic> _$$_ServiceRequestToJson(_$_ServiceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requester': instance.requester,
      'servicer': instance.servicer,
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType]!,
      'amount': instance.amount,
      'status': _$RequestStatusEnumMap[instance.status]!,
      'origin': instance.origin,
      'destination': instance.destination,
      'requestDate': JsonConverterWrapper.toJson(instance.requestDate),
      'date': JsonConverterWrapper.toJson(instance.date),
    };

const _$ServiceTypeEnumMap = {
  ServiceType.mechanicRequest: 'mechanicRequest',
  ServiceType.towing: 'towing',
  ServiceType.merchanicShop: 'merchanicShop',
  ServiceType.none: 'none',
};

const _$RequestStatusEnumMap = {
  RequestStatus.requested: 'requested',
  RequestStatus.accepted: 'accepted',
  RequestStatus.inProgress: 'inProgress',
  RequestStatus.none: 'none',
  RequestStatus.cancelled: 'cancelled',
  RequestStatus.completed: 'completed',
};
