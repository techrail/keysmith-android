import 'dart:math';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:keysmith/src/core/common/widgets/keysmith/keysmith_state.dart';
import 'package:keysmith/src/core/utils/constants/password_characters.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/core/utils/validator/password_strength_validator.dart';
import 'package:keysmith/src/features/add/utils/constants/password_strength_criteria.dart';

class KeysmithCubit extends Cubit<KeysmithState> {
  KeysmithCubit() : super(const KeysmithState()) {
    _generatePassword();
  }

  ///Updates the [length] of the generated password and generates a new password.
  ///
  void updatePasswordLength(double length) {
    emit(state.copyWith(passwordLength: length));
    _generatePassword();
  }

  ///Updates the [criteria] of the generated password and generates a new password.
  ///
  void updatePasswordCriteria({
    required PasswordStrengthCriteria criteria,
    required bool isChecked,
  }) {
    // The list in the state is marked as 'const' which is unmodifiable.
    // creating a variable using '=' operation will only create a reference to
    // this list which will still be unmodifiable.
    // Hence, to update the list, a 1:1 copy is made using 'toList' method and
    // that copy is updated.
    final newCriteria = state.criteria.toList();
    if (isChecked) {
      if (!state.criteria.contains(criteria)) {
        newCriteria.add(criteria);
      }
    } else {
      //at least one criteria must stay selected.
      if (state.criteria.length == 1) {
        return;
      }
      newCriteria.remove(criteria);
    }
    emit(state.copyWith(criteria: newCriteria));
    _generatePassword();
  }

  ///Generates a new password
  ///
  void refreshPassword() {
    _generatePassword();
  }

  void _generatePassword() {
    if (state.passwordLength < 0) {
      emit(state.copyWith(
          appState: AppState.error,
          error: "Password length should not be less than 0."));
      return;
    }
    String characters = '';
    if (state.criteria.contains(PasswordStrengthCriteria.lowerCase)) {
      characters += lowerCaseChar;
    }

    if (state.criteria.contains(PasswordStrengthCriteria.upperCase)) {
      characters += uppercaseChar;
    }

    if (state.criteria.contains(PasswordStrengthCriteria.numeric)) {
      characters += numericChar;
    }

    if (state.criteria.contains(PasswordStrengthCriteria.special)) {
      characters += specialChar;
    }

    late final Random random;

    try {
      random = Random.secure();
    } catch (error) {
      emit(state.copyWith(appState: AppState.error, error: error.toString()));
      return;
    }

    if (characters.length <= 1) {
      emit(state.copyWith(
          appState: AppState.error, error: "Invalid charater length"));
    }

    final password = String.fromCharCodes(Iterable.generate(
      state.passwordLength.round(),
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));

    emit(state.copyWith(appState: AppState.success, password: password));

    _updatePasswordStrength();
  }

  void _updatePasswordStrength() {
    final double strength = estimatePasswordStrength(state.password);
    emit(state.copyWith(strength: strength));
  }
}
