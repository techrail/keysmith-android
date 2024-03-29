import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:keysmith/src/core/common/widgets/keysmith/keysmith_cubit.dart';
import 'package:keysmith/src/core/common/widgets/keysmith/keysmith_state.dart';
import 'package:keysmith/src/features/add/presentation/widgets/check_box_row_widget.dart';
import 'package:keysmith/src/features/add/presentation/widgets/password_strength_indicator_widget.dart';
import 'package:keysmith/src/features/add/utils/constants/password_strength_criteria.dart';

class KeysmithWidget extends HookWidget {
  ///Provdies the generated password by this password generator.
  ///
  final void Function(String password) onPasswordChanged;

  ///Generates a password.
  ///
  ///Provides parameters to modify generated password
  ///such as length and criteria.
  ///
  const KeysmithWidget({
    super.key,
    required this.onPasswordChanged,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorAnimationController = useAnimationController();
    return BlocProvider(
      create: (context) => KeysmithCubit(),
      child: Column(
        children: [
          BlocBuilder<KeysmithCubit, KeysmithState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (context, state) {
              onPasswordChanged(state.password);
              return Text(
                state.password,
                style: Theme.of(context).textTheme.titleMedium,
              );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<KeysmithCubit, KeysmithState>(
            buildWhen: (previous, current) =>
                previous.strength != current.strength,
            builder: (context, state) {
              indicatorAnimationController.animateTo(
                state.strength,
                duration: const Duration(milliseconds: 250),
              );
              return PasswordStrengthIndicatorWidget(
                animationController: indicatorAnimationController,
              );
            },
          ),
          BlocBuilder<KeysmithCubit, KeysmithState>(
              buildWhen: (previous, current) =>
                  previous.passwordLength != current.passwordLength,
              builder: (context, state) => Slider(
                    value: state.passwordLength,
                    min: 8.0,
                    max: 20.0,
                    divisions: ((20 - 8) + 1),
                    onChanged: (value) =>
                        BlocProvider.of<KeysmithCubit>(context)
                            .updatePasswordLength(value),
                  )),
          //TODO: create constants for this text
          BlocBuilder<KeysmithCubit, KeysmithState>(
            buildWhen: (previous, current) =>
                previous.passwordLength != current.passwordLength,
            builder: (context, state) => Text(
              "Length: ${state.passwordLength.round()}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Include: ',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          ...List.generate(
            PasswordStrengthCriteria.values.length,
            (index) {
              final criteria = PasswordStrengthCriteria.values[index];
              return BlocBuilder<KeysmithCubit, KeysmithState>(
                buildWhen: (previous, current) =>
                    previous.criteria != current.criteria,
                builder: (context, state) {
                  return CheckedTitleRowWidget(
                      title: criteria.name,
                      isChecked: state.criteria.contains(criteria),
                      onChanged: (isChecked) {
                        BlocProvider.of<KeysmithCubit>(context)
                            .updatePasswordCriteria(
                          criteria: criteria,
                          isChecked: isChecked ?? false,
                        );
                      });
                },
              );
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<KeysmithCubit, KeysmithState>(
            builder: (context, state) => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer),
              onPressed: () =>
                  BlocProvider.of<KeysmithCubit>(context).refreshPassword(),
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
