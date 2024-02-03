import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/utils/validator/password_strength_validator.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';

@LazySingleton(as: PasswordStrengthUsecase)
class PasswordStrengthUsecaseImpl extends PasswordStrengthUsecase {
  @override
  double call(PasswordStrengthParams params) {
    final String password = params.password;
    final double strength = estimatePasswordStrength(password);
    return strength;
  }
}
