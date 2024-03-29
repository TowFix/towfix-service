import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'address.freezed.dart';
part 'address.g.dart';

/// Address entity

@freezed
class Address with _$Address {
  /// Constructor
  const factory Address({
    /// Firebase document ID
    required String id,

    /// Full Address name
    required String name,

    /// Mobile phone number
    required double longitude,

    /// Email Address
    required double latitude,

    /// Date created
  }) = _Address;

  /// Initial state with dummy data
  factory Address.initial() => const Address(
        id: '',
        latitude: 0.0,
        longitude: 0.0,
        name: '',
      );

  /// Convert from json to model
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  // const Address._();

  // @override
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'name': name
  //   };
  // }

  /// String representation
}
