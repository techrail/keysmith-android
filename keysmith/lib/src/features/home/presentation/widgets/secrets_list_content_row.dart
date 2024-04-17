import 'package:flutter/material.dart';

class SecretsListContentRow extends StatelessWidget {
  final IconData icon;
  final String content;
  final void Function(String content)? onLongPress;
  final void Function()? onTap;

  const SecretsListContentRow({
    super.key,
    required this.icon,
    required this.content,
    this.onLongPress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(
          ":",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 25),
        InkWell(
          onLongPress: onLongPress != null
              ? () {
                  if (onLongPress != null) {
                    onLongPress!(content);
                  }
                }
              : null,
          onTap: onTap,
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
