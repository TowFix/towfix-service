import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../dto/profile/profile.dart';

abstract class CacheService {
  // save user profie
  Future<void> saveProfile(Profile profile);

  // get user profile
  Profile get profile;

  /// clear profile
  Future<void> clearProfile();

  /// clear cache
  Future<void> clearCache();
}

class HiveCacheServiceImpl implements CacheService {
  static const String databaseName = 'towfix-service.db';
  final _profile = 'profile';

  static Future<void> init() async {
    final appDocumentDirectory = await path_provider.getTemporaryDirectory();
    // await Hive.init(appDocumentDirectory);
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive
      ..registerAdapter(ProfileAdapter())
      ..registerAdapter(UserTypeAdapter());
    // Hive.registerAdapter(AddressAdapter());

    // open box
    await Hive.openBox(databaseName);
  }

  // * instance of database box
  static final databaseBox = Hive.box(databaseName);

  //* clear cache
  @override
  Future<void> clearCache() async {
    await databaseBox.clear();
  }

  //* clear profile
  @override
  Future<void> clearProfile() async {
    await databaseBox.delete(_profile);
  }

  ///* get saved profile
  @override
  Profile get profile => databaseBox.get(_profile);

  ///* save new profile
  @override
  Future<void> saveProfile(Profile profile) async {
    await databaseBox.put(_profile, profile);
  }
}
