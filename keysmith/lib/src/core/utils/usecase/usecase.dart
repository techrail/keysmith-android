import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

///Use [NoFailureUseCase] only when the result is not expected to throw any
///errors.
abstract class NoFailureUseCase<Type, Params> {
  Type call(Params params);
}

/// this class is used for method with no params
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
