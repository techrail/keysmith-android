import 'package:beamer/beamer.dart';
import 'package:keysmith/src/features/add/location.dart';
import 'package:keysmith/src/features/add/presentation/pages/add_page.dart';
import 'package:keysmith/src/features/favourites/location.dart';
import 'package:keysmith/src/features/favourites/presentation/pages/favourites_page.dart';
import 'package:keysmith/src/features/home/location.dart';
import 'package:keysmith/src/features/home/presentation/pages/home_page.dart';
import 'package:keysmith/src/features/settings/components/location.dart';
import 'package:keysmith/src/features/settings/pages/settings_page.dart';

final List<BeamerDelegate> routerDelegates = [
  BeamerDelegate(
      initialPath: HomePage.routeName,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation()],
      )),
  BeamerDelegate(
      initialPath: FavouritesPage.routeName,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [FavouriteLocation()],
      )),
  BeamerDelegate(
      initialPath: AddPage.routeName,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [AddLocation()],
      )),
  BeamerDelegate(
      initialPath: FavouritesPage.routeName,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [FavouriteLocation()],
      )),
  BeamerDelegate(
      initialPath: SettingsPage.routeName,
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [SettingsLocation()],
      ))
];
