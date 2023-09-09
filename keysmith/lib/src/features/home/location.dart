import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import 'package:keysmith/src/features/home/presentation/pages/home_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == HomePage.routeName)
        const BeamPage(child: HomePage())

      ///if more pages are navigated to from home page, add them here.
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [HomePage.routeName];
}
