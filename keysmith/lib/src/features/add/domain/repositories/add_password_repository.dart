import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';

///Makes calls to datasource.
abstract class AddPasswordRepository {
  ///Saves the secret to persistant storage.
  ///
  ///returns a [Failure] if an error occurs.
  ///
  Future<Either<Failure, NoValue>> saveSecret(
      {required PasswordSecretEntity entity});
}
