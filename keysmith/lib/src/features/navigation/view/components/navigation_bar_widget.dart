import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  final int activeIndex;
  const NavigationBarWidget({
    required this.activeIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: activeIndex,
      onDestinationSelected: (index) =>
          AutoTabsRouter.of(context).setActiveIndex(index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_filled),
          label: "Home",
        ),
        NavigationDestination(
          icon: Icon(Icons.star_outline),
          selectedIcon: Icon(Icons.star),
          label: "Favourites",
        ),
        NavigationDestination(
          icon: Icon(Icons.lock_open_outlined),
          selectedIcon: Icon(Icons.lock),
          label: "KeySmith",
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }
}
