import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keysmith/src/features/add/presentation/views/add_password_view.dart';

@RoutePage()
class AddPage extends StatelessWidget {
  static const routeName = "/add";
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddPasswordView();
  }
}
