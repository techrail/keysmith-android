import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/common/models/password_secret_model.dart';
import 'package:keysmith/src/core/common/services/database/service/local_db_service.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/data/datasources/add_password_datasource.dart';
import 'package:keysmith/src/features/add/utils/constants/constants.dart';

@Named(localAddDatasourceKey)
@LazySingleton(as: AddPasswordDatasource)
class AddPasswordLocalDatasourceImpl implements AddPasswordDatasource {
  final LocalSecretsDBService _db;

  AddPasswordLocalDatasourceImpl({required LocalSecretsDBService db})
      : _db = db;
  @override
  Future<Either<Failure, NoValue>> saveSecret(
      {required PasswordSecretEntity entity}) async {
    final model = PasswordSecretModel(
      title: entity.title,
      id: entity.id,
      email: entity.email,
      password: entity.password,
      createdAt: entity.createdAt,
      website: entity.website,
      modifiedAt: entity.modifiedAt,
    );
    try {
      _db.writeSecret(secret: model.toMap());
      return Future.value(right(NoValue()));
    } catch (error) {
      final failure = CacheFailure(message: error.toString());
      return Future.value(left(failure));
    }
  }
}
