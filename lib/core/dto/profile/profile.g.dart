// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 0;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      id: fields[0] as String,
      email: fields[1] as String,
      lastName: fields[2] as String,
      firstName: fields[3] as String,
      dob: fields[4] as DateTime,
      phoneNumber: fields[5] as String,
      fcmToken: fields[6] as String,
      displayName: fields[8] as String,
      userType: fields[9] as UserType,
      date: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.fcmToken)
      ..writeByte(8)
      ..write(obj.displayName)
      ..writeByte(9)
      ..write(obj.userType)
      ..writeByte(10)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserTypeAdapter extends TypeAdapter<UserType> {
  @override
  final int typeId = 3;

  @override
  UserType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserType.vendor;
      case 1:
        return UserType.customer;
      default:
        return UserType.vendor;
    }
  }

  @override
  void write(BinaryWriter writer, UserType obj) {
    switch (obj) {
      case UserType.vendor:
        writer.writeByte(0);
        break;
      case UserType.customer:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String,
      email: json['email'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      dob: DateTime.parse(json['dob'] as String),
      phoneNumber: json['phoneNumber'] as String,
      fcmToken: json['fcmToken'] as String,
      displayName: json['displayName'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      date: DateTime.parse(JsonConverterWrapper.date(json, 'date') as String),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'dob': instance.dob.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'fcmToken': instance.fcmToken,
      'displayName': instance.displayName,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'date': JsonConverterWrapper.toJson(instance.date),
    };

const _$UserTypeEnumMap = {
  UserType.vendor: 'vendor',
  UserType.customer: 'customer',
};
