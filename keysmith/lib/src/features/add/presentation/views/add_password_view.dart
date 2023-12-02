import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';
import 'package:keysmith/src/features/add/presentation/widgets/password_strength_indicator_widget.dart';

//TODO: add logic
//1. validates password's strength, can be a range from 1 to 10 represented as a coloured bar. state will provide the stregth represented in int.

//2. validates website url syntax. provides error if wrong. Ignores validation if the field is empty.
//3. If a web address is proivded, the avatar is updated with fevicon of the given website.
//TODO: 4. Add a done button and tapping it will persist the entered data.

//errors to handle:
//- Password validation
//- Web address validation
//- 'On save' errors.
//- any other global error.

class AddPasswordView extends StatelessWidget {
  const AddPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: navigate to secrets list view once the data is successfully saved.
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Password'),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("done pressed.");
                //TODO: save all the data.
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: BlocBuilder<AddPasswordCubit, AddPasswordState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: TextEditingController(
                            //TODO: this text should only update once, at initial load.
                            text: state.title,
                          ),
                          decoration: const InputDecoration(hintText: "Title"),
                        )),
                        const SizedBox(width: 8),

                        ///TODO: replace this with cached image.
                        const InkWell(
                          customBorder: CircleBorder(),
                          child: CircleAvatar(
                            maxRadius: 25,
                            child: Icon(Icons.key_rounded),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    InputTextFieldWidget(
                      leadingIcon: Icons.person,
                      label: "Login",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        InputTextFieldWidget(
                          leadingIcon: Icons.key_outlined,
                          controller: TextEditingController(),
                          label: "Password",
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(45, 20, 0, 0),
                          child: PasswordStrengthIndicatorWidget(progress: 0.5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    //TODO: validate website string
                    InputTextFieldWidget(
                      leadingIcon: Icons.language_outlined,
                      label: "Website",
                      controller: TextEditingController(),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
