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
