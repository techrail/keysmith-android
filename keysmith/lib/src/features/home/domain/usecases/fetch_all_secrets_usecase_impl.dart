import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';
import 'package:keysmith/src/features/home/domain/repositories/secrets_list_repository.dart';
import 'package:keysmith/src/features/home/domain/usecases/usecases.dart';
import 'package:keysmith/src/features/home/presentation/states/models/secrets_list_model.dart';

@Injectable(as: FetchAllSecretsUsecase)
class FetchAllSecretsUsecaseImpl implements FetchAllSecretsUsecase {
  final SecretListRepository _repo;

  FetchAllSecretsUsecaseImpl({required SecretListRepository repository})
      : _repo = repository;

  @override
  Future<Either<Failure, List<SecretsListModel>>> call(NoParams params) async {
    final result = await _repo.fetchAllSecrets();
    return result.map(
      (entites) => entites
          .map((entity) => SecretsListModel.fromEntity(entity: entity))
          .toList(),
    );
  }
}
