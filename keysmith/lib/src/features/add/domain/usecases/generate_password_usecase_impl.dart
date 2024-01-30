import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/error/failures.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';
import 'package:keysmith/src/features/add/utils/constants/constants.dart';

@LazySingleton(as: GeneratePasswordUsecase)
class GeneratePasswordUsecaseImpl extends GeneratePasswordUsecase {
  @override
  Future<Either<Failure, String>> call(GeneratePasswordParams params) {
    String characters = '';

    if (params.includeLowerCase) {
      characters += lowerCaseChar;
    }

    if (params.includeUpperCase) {
      characters += uppercaseChar;
    }

    if (params.includeNumeric) {
      characters += numericChar;
    }

    if (params.includeSpecial) {
      characters += specialChar;
    }

    late final Random random;

    try {
      random = Random.secure();
    } catch (error) {
      return Future.value(left(ValidationFailure(message: error.toString())));
    }

    final password = String.fromCharCodes(Iterable.generate(
      params.length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ));

    return Future.value(right(password));
  }
}
