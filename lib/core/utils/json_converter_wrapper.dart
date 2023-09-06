import 'package:cloud_firestore/cloud_firestore.dart';

/// Handy json converter for external apis
class JsonConverterWrapper {
  /// Get date
  static String date(Map<dynamic, dynamic> json, Object value) {
    try {
      if (json[value] == null) {
        return '2022-02-04T19:51:39.671806Z';
      } else if (json[value] is String) {
        return DateTime.parse(json[value] as String).toString();
      }
      return (json[value] as Timestamp).toDate().toString();
    } catch (e) {
      return '2022-02-04T19:51:39.671806Z';
    }
  }

  /// Get Profile
  // static Profile profile() => Profile.initial();

  /// get Address
  // static Address address() => Address.initial();

  /// Get TimeStamp
  static Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
