import 'package:flutter/material.dart';
import 'package:keysmith/src/features/home/presentation/views/home_view.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
