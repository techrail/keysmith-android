import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? message;
  const ErrorPage({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              message ?? "Requested Page is not found.",
              style: const TextStyle(color: Colors.red),
            ),
          )),
    );
  }
}
