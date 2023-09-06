// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequest {
  String get id => throw _privateConstructorUsedError;
  Profile get requester => throw _privateConstructorUsedError;
  Profile get servicer => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;
  Address get serviceLocation => throw _privateConstructorUsedError;
  Address get destination => throw _privateConstructorUsedError;
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res, ServiceRequest>;
  @useResult
  $Res call(
      {String id,
      Profile requester,
      Profile servicer,
      ServiceType serviceType,
      double amount,
      RequestStatus status,
      Address serviceLocation,
      Address destination,
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      DateTime date});

  $ProfileCopyWith<$Res> get requester;
  $ProfileCopyWith<$Res> get servicer;
  $AddressCopyWith<$Res> get serviceLocation;
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res, $Val extends ServiceRequest>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requester = null,
    Object? servicer = null,
    Object? serviceType = null,
    Object? amount = null,
    Object? status = null,
    Object? serviceLocation = null,
    Object? destination = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requester: null == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Profile,
      servicer: null == servicer
          ? _value.servicer
          : servicer // ignore: cast_nullable_to_non_nullable
              as Profile,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      serviceLocation: null == serviceLocation
          ? _value.serviceLocation
          : serviceLocation // ignore: cast_nullable_to_non_nullable
              as Address,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get requester {
    return $ProfileCopyWith<$Res>(_value.requester, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get servicer {
    return $ProfileCopyWith<$Res>(_value.servicer, (value) {
      return _then(_value.copyWith(servicer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get serviceLocation {
    return $AddressCopyWith<$Res>(_value.serviceLocation, (value) {
      return _then(_value.copyWith(serviceLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get destination {
    return $AddressCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$_ServiceRequestCopyWith(
          _$_ServiceRequest value, $Res Function(_$_ServiceRequest) then) =
      __$$_ServiceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Profile requester,
      Profile servicer,
      ServiceType serviceType,
      double amount,
      RequestStatus status,
      Address serviceLocation,
      Address destination,
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      DateTime date});

  @override
  $ProfileCopyWith<$Res> get requester;
  @override
  $ProfileCopyWith<$Res> get servicer;
  @override
  $AddressCopyWith<$Res> get serviceLocation;
  @override
  $AddressCopyWith<$Res> get destination;
}

/// @nodoc
class __$$_ServiceRequestCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res, _$_ServiceRequest>
    implements _$$_ServiceRequestCopyWith<$Res> {
  __$$_ServiceRequestCopyWithImpl(
      _$_ServiceRequest _value, $Res Function(_$_ServiceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requester = null,
    Object? servicer = null,
    Object? serviceType = null,
    Object? amount = null,
    Object? status = null,
    Object? serviceLocation = null,
    Object? destination = null,
    Object? date = null,
  }) {
    return _then(_$_ServiceRequest(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requester: null == requester
          ? _value.requester
          : requester // ignore: cast_nullable_to_non_nullable
              as Profile,
      servicer: null == servicer
          ? _value.servicer
          : servicer // ignore: cast_nullable_to_non_nullable
              as Profile,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      serviceLocation: null == serviceLocation
          ? _value.serviceLocation
          : serviceLocation // ignore: cast_nullable_to_non_nullable
              as Address,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequest implements _ServiceRequest {
  const _$_ServiceRequest(
      {required this.id,
      required this.requester,
      required this.servicer,
      required this.serviceType,
      required this.amount,
      required this.status,
      required this.serviceLocation,
      required this.destination,
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required this.date});

  factory _$_ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestFromJson(json);

  @override
  final String id;
  @override
  final Profile requester;
  @override
  final Profile servicer;
  @override
  final ServiceType serviceType;
  @override
  final double amount;
  @override
  final RequestStatus status;
  @override
  final Address serviceLocation;
  @override
  final Address destination;
  @override
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  final DateTime date;

  @override
  String toString() {
    return 'ServiceRequest(id: $id, requester: $requester, servicer: $servicer, serviceType: $serviceType, amount: $amount, status: $status, serviceLocation: $serviceLocation, destination: $destination, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            (identical(other.servicer, servicer) ||
                other.servicer == servicer) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceLocation, serviceLocation) ||
                other.serviceLocation == serviceLocation) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, requester, servicer,
      serviceType, amount, status, serviceLocation, destination, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      __$$_ServiceRequestCopyWithImpl<_$_ServiceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestToJson(
      this,
    );
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  const factory _ServiceRequest(
      {required final String id,
      required final Profile requester,
      required final Profile servicer,
      required final ServiceType serviceType,
      required final double amount,
      required final RequestStatus status,
      required final Address serviceLocation,
      required final Address destination,
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required final DateTime date}) = _$_ServiceRequest;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequest.fromJson;

  @override
  String get id;
  @override
  Profile get requester;
  @override
  Profile get servicer;
  @override
  ServiceType get serviceType;
  @override
  double get amount;
  @override
  RequestStatus get status;
  @override
  Address get serviceLocation;
  @override
  Address get destination;
  @override
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
