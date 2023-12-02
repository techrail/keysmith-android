import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/core/common/settings/settings_controller.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  configureDependencies();
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await sl.get<SettingsController>().loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const ProviderScope(child: MyApp()));
}
