import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/features/home/domain/repositories/secrets_list_repository.dart';
import 'package:keysmith/src/features/home/domain/usecases/usecases.dart';
import 'package:keysmith/src/features/home/presentation/states/models/secrets_list_model.dart';

@Injectable(as: DeleteSecretsUsecase)
class DeleteSecretsUsecaseImpl extends DeleteSecretsUsecase {
  final SecretListRepository _repo;

  DeleteSecretsUsecaseImpl({required SecretListRepository repository})
      : _repo = repository;

  @override
  Future<Either<Failure, NoValue>> call(List<SecretsListModel> params) {
    final List<SecretsEntity> deleteEntityList =
        params.map((model) => model.toEntity()).toList();

    final result = _repo.deleteSecrets(secrets: deleteEntityList);

    return result;
  }
}
