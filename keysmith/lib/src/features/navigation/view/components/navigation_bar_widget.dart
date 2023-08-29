import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keysmith/src/features/navigation/view/state/navigation_provider.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      selectedIndex: ref.watch(navigationProvider),
      onDestinationSelected: (index) =>
          ref.read(navigationProvider.notifier).state = index,
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
          icon: Icon(Icons.add),
          selectedIcon: Icon(Icons.add),
          label: "Add",
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
