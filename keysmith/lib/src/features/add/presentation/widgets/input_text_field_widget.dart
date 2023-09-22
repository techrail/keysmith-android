import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String label;

  const InputTextFieldWidget({
    super.key,
    required this.leadingIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(leadingIcon),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: label),
          ),
        )
      ],
    );
  }
}
