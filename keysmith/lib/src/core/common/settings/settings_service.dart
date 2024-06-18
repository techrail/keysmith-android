import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/services/shared_preferences/shared_pref_service.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
@injectable
class SettingsService {
  final SharedPrefService _prefService;

  SettingsService({required SharedPrefService prefService})
      : _prefService = prefService;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async =>
      _prefService.getUserTheme() ?? ThemeMode.system;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async =>
      await _prefService.setUserTheme(theme: theme);
}
