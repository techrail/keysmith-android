// Set up the SettingsController, which will glue user settings to multiple
// Flutter Widgets.
import 'package:keysmith/src/core/common/settings/settings_controller.dart';
import 'package:keysmith/src/core/common/settings/settings_service.dart';

final settingsController = SettingsController(SettingsService());
