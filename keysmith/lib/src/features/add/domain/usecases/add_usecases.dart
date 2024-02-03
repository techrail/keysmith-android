import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';

///Create a [PasswordSecretEntity] with given information to create a password entry.
///
abstract class AddPasswordUsecase extends Usecase<NoValue, AddPasswordParams> {}

///Parameters used to call use-case to create and add a new password entity.
class AddPasswordParams extends Equatable {
  final String? title;
  final String email;
  final String password;
  final String? website;

  const AddPasswordParams({
    required this.title,
    required this.email,
    required this.password,
    required this.website,
  });

  @override
  List<Object?> get props => [
        title,
        email,
        password,
        website,
      ];
}

///Generates a password with given parameters.
///
abstract class GeneratePasswordUsecase
    extends Usecase<String, GeneratePasswordParams> {}

///Parameters used to call use-case to generate a new password.
///
class GeneratePasswordParams extends Equatable {
  final int length;
  final bool includeUpperCase;
  final bool includeLowerCase;
  final bool includeNumeric;
  final bool includeSpecial;

  const GeneratePasswordParams({
    required this.length,
    required this.includeUpperCase,
    required this.includeLowerCase,
    required this.includeNumeric,
    required this.includeSpecial,
  });

  @override
  List<Object?> get props => [
        length,
        includeLowerCase,
        includeUpperCase,
        includeNumeric,
        includeSpecial,
      ];
}

///Validates strength of a given password.
///
abstract class PasswordStrengthUsecase
    extends NoFailureUseCase<double, PasswordStrengthParams> {}

///Parameters to validate strength of a password.
class PasswordStrengthParams extends Equatable {
  final String password;

  const PasswordStrengthParams({required this.password});

  @override
  List<Object?> get props => [password];
}
