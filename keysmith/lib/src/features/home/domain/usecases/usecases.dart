import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/models/no_value.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';
import 'package:keysmith/src/features/home/presentation/states/models/secrets_list_model.dart';

///TODO: implement
abstract class FetchAllSecretsUsecase
    extends Usecase<List<SecretsListModel>, NoParams> {}

abstract class StreamAllSecretsUsecase
    extends Usecase<Stream<List<SecretsEntity>>, NoParams> {}

abstract class DeleteSecretsUsecase
    extends Usecase<NoValue, List<SecretsListModel>> {}
