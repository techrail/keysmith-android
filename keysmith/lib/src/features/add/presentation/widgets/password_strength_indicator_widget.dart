import 'package:flutter/material.dart';

class PasswordStrengthIndicatorWidget extends StatelessWidget {
  final double progress;

  ///Displays the strength of the password.
  ///
  ///* [progress] : The value should be between 0 and 1.
  const PasswordStrengthIndicatorWidget({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Strength"),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          //TODO: change the color based on value
          value: progress,
          color: Colors.green,
          backgroundColor: Colors.grey.shade300,
        ),
      ],
    );
  }
}
