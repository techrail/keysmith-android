import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keysmith/src/features/navigation/routes/router_delegates.dart';
import 'package:keysmith/src/features/navigation/view/components/navigation_bar_widget.dart';
import 'package:keysmith/src/features/navigation/view/state/navigation_provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) => IndexedStack(
          index: ref.watch(navigationProvider),
          children: List.generate(
            routerDelegates.length,
            (index) => Beamer(routerDelegate: routerDelegates[index]),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
