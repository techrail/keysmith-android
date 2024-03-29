// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';
import 'package:keysmith/src/features/add/utils/constants/password_strength_criteria.dart';

class KeysmithState extends Equatable implements Copyable<KeysmithState> {
  ///Type of state the view is in.
  ///
  final AppState appState;

  ///Generated password.
  ///
  final String password;

  ///Length of the generated password.
  ///
  final double passwordLength;

  ///Value for the strength display.
  ///Defaults to 0. Valid range is between 1 to 10.
  ///
  final double strength;

  ///Criteria of the generated passsword.
  ///
  final List<PasswordStrengthCriteria> criteria;

  final String error;

  const KeysmithState({
    this.password = "",
    this.passwordLength = 8,
    this.strength = 0.0,
    this.criteria = const [PasswordStrengthCriteria.lowerCase],
    this.appState = AppState.initial,
    this.error = "",
  });

  @override
  List<Object> get props =>
      [password, passwordLength, strength, criteria, appState, error];

  @override
  KeysmithState copyWith({
    String? password,
    double? passwordLength,
    List<PasswordStrengthCriteria>? criteria,
    double? strength,
    AppState? appState,
    String? error,
  }) {
    return KeysmithState(
      password: password ?? this.password,
      passwordLength: passwordLength ?? this.passwordLength,
      criteria: criteria ?? this.criteria,
      strength: strength ?? this.strength,
      appState: appState ?? this.appState,
      error: error ?? this.error,
    );
  }

  @override
  KeysmithState copy() => KeysmithState(
        criteria: criteria,
        password: password,
        passwordLength: passwordLength,
        strength: strength,
        appState: appState,
        error: error,
      );
}
