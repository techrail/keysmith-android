import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:keysmith/src/features/keysmith/presentation/pages/keysmith_page.dart';

class KeysmithLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == KeysmithPage.routeName)
        const BeamPage(child: KeysmithPage())

      ///if more pages are navigated to from Keysmith page, add them here.
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [KeysmithPage.routeName];
}
