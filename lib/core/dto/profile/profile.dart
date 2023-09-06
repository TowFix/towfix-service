import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../utils/json_converter_wrapper.dart';
import '../address/address.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
@HiveType(typeId: 0)
class Profile with _$Profile {
  const factory Profile(
      {@HiveField(0) required String id,
      @HiveField(1) required String email,
      @HiveField(2) required String lastName,
      @HiveField(3) required String firstName,
      @HiveField(4) required DateTime dob,
      @HiveField(5) required String phoneNumber,
      @HiveField(6) required String fcmToken,
      // @HiveField(7) required Address address,
      @HiveField(8) required String displayName,
      @HiveField(9) required UserType userType,
      @HiveField(10)
      @JsonKey(
          readValue: JsonConverterWrapper.date,
          toJson: JsonConverterWrapper.toJson)
      required DateTime date}) = _Profile;

  /// Convert from json to model
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  factory Profile.initial() => Profile(
      id: '',
      email: '',
      lastName: '',
      firstName: '',
      dob: DateTime(1990),
      fcmToken: '',
      displayName: '',
      phoneNumber: '',
      userType: UserType.vendor,
      // address: Address.initial(),
      date: DateTime(2023));

  // const Profile._();

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'email': email,
  //     'lastName': lastName,
  //     'firstName': firstName,
  //     'dob': dob,
  //     'phoneNumber': phoneNumber,
  //     'fcmToken': fcmToken,
  //     'displayName': displayName,
  //     'userType': userType,
  //     'date': date,
  //   };
  // }
}

// address: $address
@HiveType(typeId: 3)
enum UserType {
  @HiveField(0)
  vendor,
  @HiveField(1)
  customer,
}
