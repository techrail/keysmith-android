import 'package:flutter/material.dart';

class CheckedTitleRowWidget extends StatelessWidget {
  final String title;
  final void Function(bool? isChecked)? onChanged;
  final bool isChecked;

  const CheckedTitleRowWidget({
    required this.title,
    required this.onChanged,
    this.isChecked = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
