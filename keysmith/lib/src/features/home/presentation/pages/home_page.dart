import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keysmith/src/features/home/presentation/views/home_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
