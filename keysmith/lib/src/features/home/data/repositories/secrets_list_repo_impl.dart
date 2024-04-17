import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/data/datasources/secret_list_datasource.dart';
import 'package:keysmith/src/features/home/domain/repositories/secrets_list_repository.dart';
import 'package:keysmith/src/features/home/utils/constants.dart';

@LazySingleton(as: SecretListRepository)
class SecretListRepositoryImpl extends SecretListRepository {
  final SecretListDatasoruce _localDatasource;
  final SecretListDatasoruce _remoteDatasource;

  SecretListRepositoryImpl({
    @Named(localSecretListDSKey) required SecretListDatasoruce localDatasource,
    @Named(remoteSecretListDSKey)
    required SecretListDatasoruce remoteDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, NoValue>> deleteSecrets(
      {required List<SecretsEntity> secrets}) {
    //TODO: implement remote datasource
    return _localDatasource.deleteSecrets(secrets: secrets);
  }

  @override
  Future<Either<Failure, List<SecretsEntity>>> fetchAllSecrets() {
    //TODO: implement remote datasource
    return _localDatasource.fetchAllSecrets();
  }

  @override
  Future<Either<Failure, Stream<List<SecretsEntity>>>> streamAllSecrets() {
    //TODO: figure out a logic to combine local and remote streams
    return _localDatasource.streamAllSecrets();
    //stream is tested implement datasource
    // final Stream<List<SecretsEntity<dynamic>>> testStream = Stream.periodic(
    //     const Duration(seconds: 1),
    //     (count) => List.generate(
    //           count,
    //           (index) => PasswordSecretEntity(
    //             title: "this is title of entry: $index",
    //             email: "meEmail@${index}mail.com",
    //             password: "this${index}pass$index",
    //             website: "www.${index}site.com",
    //             additionalInfo: null,
    //           ),
    //         ));

    // return Future.value(right(testStream));
  }
}
