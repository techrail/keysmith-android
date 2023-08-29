import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keysmith/src/features/navigation/view/components/navigation_bar_widget.dart';
import 'package:keysmith/src/features/navigation/view/state/navigation_provider.dart';

class NavigationPage extends StatelessWidget {
  static String routeName = '/';

  final pages = [
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('Page 1'),
    ),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: const Text('Page 4'),
    ),
    Container(
      color: Colors.purple,
      alignment: Alignment.center,
      child: const Text('Page 5'),
    ),
  ];

  NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) => pages[ref.watch(navigationProvider)],
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
