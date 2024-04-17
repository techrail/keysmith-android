import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/data/datasources/secret_list_datasource.dart';
import 'package:keysmith/src/features/home/utils/constants.dart';
import 'package:keysmith/src/features/home/utils/type_defs.dart';

@Named(remoteSecretListDSKey)
@LazySingleton(as: SecretListDatasoruce)
class RemoteSecretListDatasourceImpl implements SecretListDatasoruce {
  @override
  Future<Either<Failure, NoValue>> deleteSecrets(
      {required List<SecretsEntity> secrets}) {
    // TODO: implement deleteSecrets
    throw UnimplementedError();
  }

  @override
  SecretsListEntityResult fetchAllSecrets() {
    // TODO: implement fetchAllSecrets
    throw UnimplementedError();
  }

  @override
  SecretsListEntityStreamResult streamAllSecrets() {
    // TODO: implement streamAllSecrets
    throw UnimplementedError();
  }
}
