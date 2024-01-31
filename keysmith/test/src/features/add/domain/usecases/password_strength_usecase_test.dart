import 'package:flutter_test/flutter_test.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';
import 'package:keysmith/src/features/add/domain/usecases/password_strength_usecase.dart';

void main() {
  PasswordStrengthUsecaseImpl? sut;

  setUp(() {
    sut = PasswordStrengthUsecaseImpl();
  });

  tearDown(() {
    sut = null;
  });

  test("for a common password returns a strength of 0.", () async {
    //ARRANGE
    const expectedResult = 0.0;
    const testInput = "password";
    late final double result;
    //ACT
    await sut!
        .call(const PasswordStrengthParams(password: testInput))
        .then((value) => result = value.getOrElse(() => 100));

    //ASSERT
    expect(result, expectedResult);
  });

  test("for a complex password returns a strength greater than 0.5.", () async {
    //ARRANGE
    const expectedResult = 0.5;
    const testInput = "gr^%0184";
    late final double result;
    //ACT
    await sut!
        .call(const PasswordStrengthParams(password: testInput))
        .then((value) => result = value.getOrElse(() => 100));

    //ASSERT
    expect(result, greaterThan(expectedResult));
  });

  test("for a long password returns a strength greater than 0.8.", () async {
    //ARRANGE
    const expectedResult = 0.8;
    const testInput = "gr^%0184poQ^)1lqx&&#";
    late final double result;
    //ACT
    await sut!
        .call(const PasswordStrengthParams(password: testInput))
        .then((value) => result = value.getOrElse(() => 100));

    //ASSERT
    expect(result, greaterThan(expectedResult));
  });

  test("for a strong password returns a strength close to 1.", () async {
    //ARRANGE
    const expectedResult = 1;
    const testInput = "gr^%0184poQ^)1lqx&&#";
    late final double result;
    //ACT
    await sut!
        .call(const PasswordStrengthParams(password: testInput))
        .then((value) => result = value.getOrElse(() => 100).roundToDouble());

    //ASSERT
    expect(result, expectedResult);
  });
}
