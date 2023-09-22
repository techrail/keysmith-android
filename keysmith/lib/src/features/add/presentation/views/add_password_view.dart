import 'package:flutter/material.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';

class AddPasswordView extends StatelessWidget {
  const AddPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(hintText: "Title"),
                  )),
                  SizedBox(width: 8),
                  CircleAvatar(
                    maxRadius: 25,
                    child: Icon(Icons.key_rounded),
                  ),
                ],
              ),
              SizedBox(height: 50),
              InputTextFieldWidget(
                leadingIcon: Icons.person,
                label: "Login",
              ),
              SizedBox(height: 50),
              InputTextFieldWidget(
                leadingIcon: Icons.key_outlined,
                label: "Password",
              ),
            ],
          ),
        ));
  }
}
