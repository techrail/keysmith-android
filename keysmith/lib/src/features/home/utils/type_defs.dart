import 'package:dartz/dartz.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';

typedef SecretsListEntityResult = Future<Either<Failure, List<SecretsEntity>>>;

typedef SecretsListEntityStreamResult
    = Future<Either<Failure, Stream<List<SecretsEntity>>>>;
