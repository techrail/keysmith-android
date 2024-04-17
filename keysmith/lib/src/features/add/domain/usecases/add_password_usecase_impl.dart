import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/domain/repositories/add_password_repository.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';

@LazySingleton(as: AddPasswordUsecase)
class AddPasswordUsecaseImpl implements AddPasswordUsecase {
  final AddPasswordRepository _addPasswordRepository;

  AddPasswordUsecaseImpl({required AddPasswordRepository addPasswordRepository})
      : _addPasswordRepository = addPasswordRepository;
  @override
  Future<Either<Failure, NoValue>> call(AddPasswordParams params) {
    return _addPasswordRepository.saveSecret(
        entity: PasswordSecretEntity(
      id: null,
      title: params.title ?? "",
      email: params.email,
      password: params.password,
      createdAt: DateTime.now(),
      website: params.website ?? "",
      additionalInfo: const {},
    ));
  }
}
