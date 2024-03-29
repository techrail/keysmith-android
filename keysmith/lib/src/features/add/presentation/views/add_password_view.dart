import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/core/common/widgets/keysmith/keysmith_widget.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/widgets/input_text_field_widget.dart';
import 'package:keysmith/src/features/add/presentation/widgets/password_strength_indicator_widget.dart';

//2. validates website url syntax. Ignores validation if the field is empty.
//3. If a web address is provided, the avatar is updated with fevicon of the given website.
//TODO: 4. Add a done button and tapping it will persist the entered data.

//errors to handle:
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
          builder: (_, state) {
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: InputTextFieldWidget(
                                controller: passwordFieldController
                                  ..text = state.password,
                                leadingIcon: Icons.key_outlined,
                                onChanged: (value) => sl<AddPasswordCubit>()
                                    .updatePasswordString(value),
                                label: "Password",
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                                child: const Icon(Icons.key_rounded),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => _showKeysmith(
                                      context,
                                      (password) => sl
                                          .get<AddPasswordCubit>()
                                          .updatePasswordString(password),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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

  AlertDialog _showKeysmith(
    BuildContext context,
    void Function(String password) onPasswordChanged,
  ) {
    String localPassword = "";
    return AlertDialog(
      title: const Text("Keysmith"),
      content: KeysmithWidget(
          onPasswordChanged: (password) => localPassword = password),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text("Dismiss")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer),
            onPressed: () {
              onPasswordChanged(localPassword);
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text("Accept")),
      ],
    );
  }
}
