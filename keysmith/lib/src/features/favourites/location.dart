import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:keysmith/src/features/favourites/presentation/pages/favourites_page.dart';

class FavouriteLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.toString() == FavouritesPage.routeName)
        const BeamPage(child: FavouritesPage())

      ///if more pages are navigated to from favourite page, add them here.
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [FavouritesPage.routeName];
}
