import 'package:beamer/beamer.dart';

import 'package:keysmith/src/core/common/widgets/error_page.dart';
import 'package:keysmith/src/features/navigation/view/components/navigation_location.dart';

final BeamerDelegate routeDelegate = BeamerDelegate(
    initialPath: '/',
    notFoundPage: const BeamPage(child: ErrorPage()),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        NavigationLocation(),
      ],
    ));
