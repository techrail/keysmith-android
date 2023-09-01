import 'package:beamer/beamer.dart';

import 'package:keysmith/src/core/common/widgets/error_page.dart';
import 'package:keysmith/src/features/home/pages/home_page.dart';
import 'package:keysmith/src/features/navigation/view/pages/navigation_page.dart';

// final BeamerDelegate routeDelegate = BeamerDelegate(
//     initialPath: '/',
//     notFoundPage: const BeamPage(child: ErrorPage()),
//     locationBuilder: BeamerLocationBuilder(
//       beamLocations: [
//         NavigationLocation(),
//       ],
//     ));

final BeamerDelegate routeDelegate = BeamerDelegate(
    initialPath: HomePage.routeName,
    notFoundPage: const BeamPage(child: ErrorPage()),
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (_, __, ___) => NavigationPage(),
      },
    ));
