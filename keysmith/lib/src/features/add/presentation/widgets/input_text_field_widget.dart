import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final IconData leadingIcon;

  final String label;

  ///Creates a textfield with leading icon.
  ///
  ///* [leadingIcon] : The icon that will be displayed at
  ///the start of the textfield.
  ///* [label] : The text to be displayed when no data
  ///in present in the textfield.
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
