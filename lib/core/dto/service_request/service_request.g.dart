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
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      serviceLocation:
          Address.fromJson(json['serviceLocation'] as Map<String, dynamic>),
      destination:
          Address.fromJson(json['destination'] as Map<String, dynamic>),
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
      'serviceLocation': instance.serviceLocation,
      'destination': instance.destination,
      'date': JsonConverterWrapper.toJson(instance.date),
    };

const _$ServiceTypeEnumMap = {
  ServiceType.mechanic: 'mechanic',
  ServiceType.towing: 'towing',
};

const _$RequestStatusEnumMap = {
  RequestStatus.active: 'active',
  RequestStatus.cancelled: 'cancelled',
  RequestStatus.completed: 'completed',
};
