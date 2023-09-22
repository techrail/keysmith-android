import 'package:flutter/material.dart';
import 'package:keysmith/src/features/add/presentation/views/add_password_view.dart';

class AddPage extends StatelessWidget {
  static const routeName = "/add";
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddPasswordView();
  }
}
