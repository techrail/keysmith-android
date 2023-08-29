import 'package:beamer/beamer.dart';
import 'package:keysmith/src/features/navigation/presentation/components/Navigation_location.dart';
import 'package:keysmith/src/core/common/widgets/error_page.dart';

final BeamerDelegate routeDelegate = BeamerDelegate(
    initialPath: '/',
    notFoundPage: const BeamPage(child: ErrorPage()),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        NavigationLocation(),
      ],
    ));
