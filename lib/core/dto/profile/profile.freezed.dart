// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get dob => throw _privateConstructorUsedError;
  @HiveField(5)
  String get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(6)
  String get fcmToken =>
      throw _privateConstructorUsedError; // @HiveField(7) required Address address,
  @HiveField(8)
  String get displayName => throw _privateConstructorUsedError;
  @HiveField(9)
  UserType get userType => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String lastName,
      @HiveField(3) String firstName,
      @HiveField(4) DateTime dob,
      @HiveField(5) String phoneNumber,
      @HiveField(6) String fcmToken,
      @HiveField(8) String displayName,
      @HiveField(9) UserType userType,
      @HiveField(10)
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      DateTime date});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? dob = null,
    Object? phoneNumber = null,
    Object? fcmToken = null,
    Object? displayName = null,
    Object? userType = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String lastName,
      @HiveField(3) String firstName,
      @HiveField(4) DateTime dob,
      @HiveField(5) String phoneNumber,
      @HiveField(6) String fcmToken,
      @HiveField(8) String displayName,
      @HiveField(9) UserType userType,
      @HiveField(10)
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      DateTime date});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? dob = null,
    Object? phoneNumber = null,
    Object? fcmToken = null,
    Object? displayName = null,
    Object? userType = null,
    Object? date = null,
  }) {
    return _then(_$_Profile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.lastName,
      @HiveField(3) required this.firstName,
      @HiveField(4) required this.dob,
      @HiveField(5) required this.phoneNumber,
      @HiveField(6) required this.fcmToken,
      @HiveField(8) required this.displayName,
      @HiveField(9) required this.userType,
      @HiveField(10)
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required this.date});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String lastName;
  @override
  @HiveField(3)
  final String firstName;
  @override
  @HiveField(4)
  final DateTime dob;
  @override
  @HiveField(5)
  final String phoneNumber;
  @override
  @HiveField(6)
  final String fcmToken;
// @HiveField(7) required Address address,
  @override
  @HiveField(8)
  final String displayName;
  @override
  @HiveField(9)
  final UserType userType;
  @override
  @HiveField(10)
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  final DateTime date;

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, lastName: $lastName, firstName: $firstName, dob: $dob, phoneNumber: $phoneNumber, fcmToken: $fcmToken, displayName: $displayName, userType: $userType, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, lastName, firstName,
      dob, phoneNumber, fcmToken, displayName, userType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String lastName,
      @HiveField(3) required final String firstName,
      @HiveField(4) required final DateTime dob,
      @HiveField(5) required final String phoneNumber,
      @HiveField(6) required final String fcmToken,
      @HiveField(8) required final String displayName,
      @HiveField(9) required final UserType userType,
      @HiveField(10)
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required final DateTime date}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get lastName;
  @override
  @HiveField(3)
  String get firstName;
  @override
  @HiveField(4)
  DateTime get dob;
  @override
  @HiveField(5)
  String get phoneNumber;
  @override
  @HiveField(6)
  String get fcmToken;
  @override // @HiveField(7) required Address address,
  @HiveField(8)
  String get displayName;
  @override
  @HiveField(9)
  UserType get userType;
  @override
  @HiveField(10)
  @JsonKey(
      readValue: JsonConverterWrapper.date, toJson: JsonConverterWrapper.toJson)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
