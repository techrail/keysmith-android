import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';
import 'package:keysmith/src/features/add/presentation/widgets/password_strength_indicator_widget.dart';

//TODO: add logic
//1. validates password's strength, can be a range from 1 to 10 represented as a coloured bar. state will provide the stregth represented in int. - done

//2. validates website url syntax. provides error if wrong. Ignores validation if the field is empty.
//3. If a web address is proivded, the avatar is updated with fevicon of the given website.
//TODO: 4. Add a done button and tapping it will persist the entered data.

//errors to handle:
//- Password validation
//- Web address validation
//- 'On save' errors.
//- any other global error.

class AddPasswordView extends HookWidget {
  const AddPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleFieldController = TextEditingController();
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();
    final websiteFieldController = TextEditingController();
    final indicatorAnimationController = useAnimationController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Password'),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("done pressed.");

                BlocProvider.of<AddPasswordCubit>(context).saveSecret();
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: BlocConsumer<AddPasswordCubit, AddPasswordState>(
          listener: (context, state) {
            switch (state.appState) {
              case AppState.initial:
                // TODO: Handle this case.
                break;
              case AppState.loading:
                // TODO: Handle this case.
                break;
              case AppState.success:
                BlocProvider.of<AddPasswordCubit>(context).reset();
                titleFieldController.clear();
                emailFieldController.clear();
                passwordFieldController.clear();
                websiteFieldController.clear();
                //TODO: navigate to secrets list view once the data is successfully saved.
                break;
              case AppState.error:
                // TODO: Handle this case.
                break;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: titleFieldController
                              ..text = state.title,
                            onChanged: (value) =>
                                sl<AddPasswordCubit>().updateTitleString(value),
                            decoration:
                                const InputDecoration(hintText: "Title"),
                          ),
                        ),
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
                    //TODO: validate
                    InputTextFieldWidget(
                      controller: emailFieldController..text = state.email,
                      leadingIcon: Icons.person,
                      label: "Email",
                      onChanged: (value) =>
                          sl<AddPasswordCubit>().updateEmailString(value),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        InputTextFieldWidget(
                          controller: passwordFieldController
                            ..text = state.password,
                          leadingIcon: Icons.key_outlined,
                          onChanged: (value) => sl<AddPasswordCubit>()
                              .updatePasswordString(value),
                          label: "Password",
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 20, 0, 0),
                          child:
                              BlocBuilder<AddPasswordCubit, AddPasswordState>(
                            buildWhen: (previous, current) =>
                                previous.strength != current.strength,
                            builder: (context, state) {
                              indicatorAnimationController.animateTo(
                                state.strength,
                                duration: const Duration(milliseconds: 250),
                              );
                              return PasswordStrengthIndicatorWidget(
                                animationController:
                                    indicatorAnimationController,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    //TODO: validate website string
                    InputTextFieldWidget(
                      controller: websiteFieldController..text = state.website,
                      leadingIcon: Icons.language_outlined,
                      label: "Website",
                      onChanged: (value) =>
                          sl<AddPasswordCubit>().updateWebsiteUrl(value),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
