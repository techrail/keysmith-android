import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/common/models/password_secret_model.dart';
import 'package:keysmith/src/core/common/services/database/service/local_db_service.dart';
import 'package:keysmith/src/core/utils/constants/secret_type.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/data/datasources/secret_list_datasource.dart';
import 'package:keysmith/src/features/home/utils/constants.dart';
import 'package:keysmith/src/features/home/utils/type_defs.dart';

@Named(localSecretListDSKey)
@LazySingleton(as: SecretListDatasoruce)
class LocalSecretListDatasourceImpl implements SecretListDatasoruce {
  final LocalSecretsDBService _db;

  LocalSecretListDatasourceImpl({required LocalSecretsDBService db}) : _db = db;
  @override
  Future<Either<Failure, NoValue>> deleteSecrets(
      {required List<SecretsEntity> secrets}) {
    // TODO: implement deleteSecrets
    throw UnimplementedError();
  }

  @override
  SecretsListEntityResult fetchAllSecrets() async {
    final data = await _db.readAllSecrets();

    try {
      final result = data.map((map) {
        final SecretType? secretType = SecretType.getSecretFromMap(map);

        if (secretType == null) {
          throw ErrorDescription("'secretType' not found.");
        }

        return switch (secretType) {
          SecretType.password => PasswordSecretModel.fromMap(map),
          // TODO: Handle this case.
          SecretType.note => throw UnimplementedError(),
        };
      }).toList();

      return Future.value(right(result));
    } catch (error) {
      return Future.value(left(ValidationFailure(message: error.toString())));
    }
  }

  @override
  SecretsListEntityStreamResult streamAllSecrets() {
    // TODO: implement streamAllSecrets
    throw UnimplementedError();
  }
}
