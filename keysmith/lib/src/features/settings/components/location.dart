import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/core/common/settings/settings_controller.dart';
import 'package:keysmith/src/features/settings/pages/settings_page.dart';

class SettingsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == SettingsPage.routeName)
        BeamPage(child: SettingsPage(controller: sl<SettingsController>()))

      ///if more pages are navigated to from Settings page, add them here.
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [SettingsPage.routeName];
}
