import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/add/data/datasources/add_password_datasource.dart';
import 'package:keysmith/src/features/add/utils/constants/constants.dart';

@Named(localAddPasswordsourceKey)
@LazySingleton(as: AddPasswordDatasource)
class AddPasswordLocalDatasourceImpl implements AddPasswordDatasource {
  @override
  Future<Either<Failure, NoValue>> saveSecret(
      {required String email,
      required String password,
      String? title,
      String? website,
      Map<String, dynamic>? additionalInfo}) {
    // TODO: implement saveSecret
    throw UnimplementedError();
  }
}
