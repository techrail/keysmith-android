import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/data/datasources/add_password_datasource.dart';
import 'package:keysmith/src/features/add/domain/repositories/add_password_repository.dart';
import 'package:keysmith/src/features/add/utils/constants/constants.dart';

@LazySingleton(as: AddPasswordRepository)
class AddPasswordRepositoryImpl implements AddPasswordRepository {
  final AddPasswordDatasource _localDatasource;
  final AddPasswordDatasource _remoteDatasource;

  AddPasswordRepositoryImpl({
    @Named(localAddDatasourceKey)
    required AddPasswordDatasource localDatasource,
    @Named(remoteAddDatasourceKey)
    required AddPasswordDatasource remoteDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, NoValue>> saveSecret(
      {required PasswordSecretEntity entity}) {
    // TODO: handle remote datasource
    final result = _localDatasource.saveSecret(entity: entity);

    return result;
  }
}
