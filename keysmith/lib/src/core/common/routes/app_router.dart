// ignore: unused_import
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/settings/settings_controller.dart';
import 'package:keysmith/src/features/add/presentation/pages/add_page.dart';
import 'package:keysmith/src/features/favourites/presentation/pages/favourites_page.dart';
import 'package:keysmith/src/features/home/presentation/pages/home_page.dart';
import 'package:keysmith/src/features/keysmith/presentation/pages/keysmith_page.dart';
import 'package:keysmith/src/features/navigation/view/pages/navigation_page.dart';
import 'package:keysmith/src/features/settings/pages/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
@lazySingleton
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: FavouritesRoute.page),
            AutoRoute(page: AddRoute.page),
            AutoRoute(page: KeysmithRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
      ];
}
