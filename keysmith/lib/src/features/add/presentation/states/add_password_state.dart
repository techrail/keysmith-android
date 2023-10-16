import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';
import 'package:keysmith/src/features/add/presentation/states/errors.dart';

class AddPasswordState extends Equatable implements Copyable<AddPasswordState> {
  ///Type of state the view is in.
  ///
  final AppState status;

  ///Text for the title field of the form.
  ///
  final String title;

  ///Text for the email field of the form.
  ///
  final String email;

  ///Text for the password field of the form.
  ///
  final String password;

  ///Text for the website.
  ///
  final String website;

  ///Wether the email entered is valid.
  ///
  final bool validEmail;

  ///Wether the web url is valid.
  final bool validUrl;

  ///Value for the strength display.
  ///Defaults to 0. Valid range is between 1 to 10.
  ///
  final int strength;

  ///Errors to be informed to the user.
  ///
  ///
  final Map<AddPasswordError, String> errors;

  const AddPasswordState({
    this.status = AppState.initial,
    this.title = "",
    this.email = "",
    this.password = "",
    this.website = "",
    this.validEmail = false,
    this.validUrl = false,
    this.strength = 0,
    this.errors = const {},
  });

  @override
  List<Object> get props {
    return [
      status,
      title,
      email,
      password,
      website,
      validEmail,
      validUrl,
      strength,
      errors,
    ];
  }

  @override
  AddPasswordState copyWith({
    AppState? status,
    String? title,
    String? email,
    String? password,
    String? website,
    bool? validEmail,
    bool? validUrl,
    int? strength,
    Map<AddPasswordError, String>? errors,
  }) {
    return AddPasswordState(
      status: status ?? this.status,
      title: title ?? this.title,
      email: email ?? this.email,
      password: password ?? this.password,
      website: website ?? this.website,
      validEmail: validEmail ?? this.validEmail,
      validUrl: validUrl ?? this.validUrl,
      strength: strength ?? this.strength,
      errors: errors ?? this.errors,
    );
  }

  @override
  bool get stringify => true;

  @override
  AddPasswordState copy() => AddPasswordState(
        status: status,
        title: title,
        email: email,
        password: password,
        website: website,
        validEmail: validEmail,
        validUrl: validUrl,
        strength: strength,
        errors: errors,
      );
}
