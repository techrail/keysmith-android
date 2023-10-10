import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keysmith/src/core/common/routes/app_router.dart';
import 'package:keysmith/src/features/navigation/view/components/navigation_bar_widget.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const HomeRoute(),
        const FavouritesRoute(),
        const AddRoute(),
        const KeysmithRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBarWidget(
            activeIndex: AutoTabsRouter.of(context).activeIndex,
          ),
        );
      },
    );
  }
}
