import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/utils/type_defs.dart';

///Makes calls to datasource to fetch or add secrets list data.
///
abstract class SecretListRepository {
  ///Fetches all stored secrets.
  ///
  ///returns a [Failure] if an error occurs.
  ///
  SecretsListEntityResult fetchAllSecrets();

  ///Provides a stream of secrets which is updated as secrets are
  ///modified or added.
  ///
  ///returns a [Failure] if an error occurs while creating the stream.
  ///
  ///Any errors that may occur while the stream is active should be caught in
  ///[onError] callback provided by the stream.
  ///
  SecretsListEntityStreamResult streamAllSecrets();

  ///Deletes the provided [secrets] permenently.
  ///
  ///returns a [Failure] if an error occurs
  ///
  Future<Either<Failure, NoValue>> deleteSecrets(
      {required List<SecretsEntity> secrets});
}
