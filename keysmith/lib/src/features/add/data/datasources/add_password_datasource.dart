import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';

///Saves the password secret.
///
abstract class AddPasswordDatasource {
  ///Saves the password.
  ///Requires [Email] and [Password].
  ///
  ///returns a [Failure] is an error occurs.
  ///
  Future<Either<Failure, NoValue>> saveSecret({
    required String email,
    required String password,
    String? title,
    String? website,
    Map<String, dynamic>? additionalInfo,
  });
}
