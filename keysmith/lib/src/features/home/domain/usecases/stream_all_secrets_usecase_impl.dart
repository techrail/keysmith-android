import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';
import 'package:keysmith/src/features/home/domain/repositories/secrets_list_repository.dart';
import 'package:keysmith/src/features/home/domain/usecases/usecases.dart';

@Injectable(as: StreamAllSecretsUsecase)
class StreamAllSecretsUsecaseImpl extends StreamAllSecretsUsecase {
  final SecretListRepository _repo;

  StreamAllSecretsUsecaseImpl({required SecretListRepository repository})
      : _repo = repository;
  @override
  Future<Either<Failure, Stream<List<SecretsEntity>>>> call(NoParams params) =>
      _repo.streamAllSecrets();
}
