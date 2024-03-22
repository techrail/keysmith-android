import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String? initialValue;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
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
    this.initialValue,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(leadingIcon),
        const SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            initialValue: initialValue,
            controller: controller,
            decoration: InputDecoration(labelText: label),
          ),
        ),
      ],
    );
  }
}
