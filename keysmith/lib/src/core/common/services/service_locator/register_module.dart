import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A class to create and inject third party dependancies.
///
/// Refer [injectable] documentationfor registering third party types:
/// https://pub.dev/packages/injectable#Registering-third-party-types
///
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
