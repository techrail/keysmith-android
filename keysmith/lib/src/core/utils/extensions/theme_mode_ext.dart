import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  static ThemeMode? fromString({required String themeString}) {
    if (themeString.isEmpty) return null;
    switch (themeString) {
      case "system":
        return ThemeMode.system;
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
