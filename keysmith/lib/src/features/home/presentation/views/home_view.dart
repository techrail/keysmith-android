import 'package:flutter/material.dart';
import 'package:keysmith/src/features/home/presentation/widgets/action_button_widget.dart';
import 'package:keysmith/src/features/home/presentation/widgets/exp_fab_widget/exp_floating_button_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Secrets")),
      floatingActionButton: ExpFloatingButtonWidget(
        children: [
          ActionButton(
            onPressed: () => print("action 1 pressed"),
            icon: const Icon(Icons.key),
          ),
          ActionButton(
            onPressed: () => print("action 2 pressed"),
            icon: const Icon(Icons.note_outlined),
          ),
        ],
      ),
    );
  }
}
