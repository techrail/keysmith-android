import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/domain/entities/password_secret_entity.dart';

///Makes calls to datasource.
abstract class AddPasswordRepository {
  ///Saves the secret to persistant storage.
  ///
  ///returns a [Failure] if an error occurs.
  ///
  Future<Either<Failure, NoValue>> saveSecret(
      {required PasswordSecretEntity entity});
}
