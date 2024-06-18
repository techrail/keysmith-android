import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/services/shared_preferences/shared_pref_service.dart';
import 'package:keysmith/src/core/utils/extensions/theme_mode_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: SharedPrefService)
class SharedPrefServiceImpl extends SharedPrefService {
  late final SharedPreferences _preferences;
  final String _themeKey = "theme";

  SharedPrefServiceImpl({required SharedPreferences sharedPreferences})
      : _preferences = sharedPreferences;

  @override
  Future<void> erasePreferences() async {
    await _preferences.clear();
  }

  @override
  ThemeMode? getUserTheme() {
    try {
      final String value = _preferences.getString(_themeKey) ?? "";
      return ThemeModeExtension.fromString(themeString: value);
    } catch (_) {
      //TODO: log errors.
      return null;
    }
  }

  @override
  Future<void> setUserTheme({required ThemeMode theme}) async {
    await _preferences.setString(_themeKey, theme.name);
  }
}
