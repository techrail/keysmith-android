//TODO: documentation
import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/utils/type_defs.dart';

abstract class SecretListDatasoruce {
  SecretsListEntityResult fetchAllSecrets();

  SecretsListEntityStreamResult streamAllSecrets();

  Future<Either<Failure, NoValue>> deleteSecrets(
      {required List<SecretsEntity> secrets});
}
