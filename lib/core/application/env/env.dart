// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY', obfuscate: true)
  static String googleMapsApiKey = _Env.googleMapsApiKey;
  // @EnviedField()
  // static const KEY2 = _Env.KEY2;
  // @EnviedField(defaultValue: 'test_')
  // static const key3 = _Env.key3;
}
