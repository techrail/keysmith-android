import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:keysmith/src/features/add/presentation/pages/add_page.dart';

class AddLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == AddPage.routeName)
        const BeamPage(child: AddPage())

      ///if more pages are navigated to from favourite page, add them here.
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [AddPage.routeName];
}
