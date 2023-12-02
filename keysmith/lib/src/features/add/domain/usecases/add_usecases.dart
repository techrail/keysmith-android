import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';

abstract class AddPasswordUseCase extends Usecase<void, AddPasswordParams> {}

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
