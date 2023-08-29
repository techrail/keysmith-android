import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:keysmith/src/features/navigation/view/pages/navigation_page.dart';

class NavigationLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == NavigationPage.routeName)
        BeamPage(child: NavigationPage())
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [NavigationPage.routeName];
}
