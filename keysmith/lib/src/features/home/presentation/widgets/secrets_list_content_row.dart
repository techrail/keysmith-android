import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SecretsListContentRow extends HookWidget {
  final IconData icon;
  final String content;
  final bool obscure;

  const SecretsListContentRow({
    super.key,
    required this.icon,
    required this.content,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final useObscure = useState(obscure);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: content));
          if (context.mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                duration: const Duration(seconds: 1),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                content: const Text("Copied to clipbaord!"),
              ),
            );
          }
        },
        onLongPress: obscure
            ? () {
                useObscure.value = !useObscure.value;
                log("log pressed secret list row");
              }
            : null,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(
              ":",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: 25),
            Text(
              useObscure.value
                  ? content.replaceAll(RegExp(r"."), "*")
                  : content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
