import 'package:flutter/material.dart';

abstract class SharedPrefService {
  ///Persists the choosen theme by the user.
  ///
  Future<void> setUserTheme({required ThemeMode theme});

  ///Retrieves theme set by the user.
  ///
  ThemeMode? getUserTheme();

  ///Removes all the presistent preferences from the device.
  ///
  Future<void> erasePreferences();
}
