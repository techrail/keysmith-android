import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/data/datasources/add_password_datasource.dart';
import 'package:keysmith/src/features/add/utils/constants/constants.dart';

@Named(remoteAddDatasourceKey)
@LazySingleton(as: AddPasswordDatasource)
class AddPasswordRemoteDatasourceImpl implements AddPasswordDatasource {
  @override
  Future<Either<Failure, NoValue>> saveSecret(
      {required PasswordSecretEntity entity}) {
    // TODO: implement saveSecret
    throw UnimplementedError();
  }
}
