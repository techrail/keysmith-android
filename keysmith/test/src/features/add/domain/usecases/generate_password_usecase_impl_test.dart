import 'package:flutter_test/flutter_test.dart';
import 'package:keysmith/src/features/add/domain/usecases/add_usecases.dart';
import 'package:keysmith/src/features/add/domain/usecases/generate_password_usecase_impl.dart';

void main() {
  GeneratePasswordUsecaseImpl? sut;

  setUp(() {
    sut = GeneratePasswordUsecaseImpl();
  });

  tearDown(() {
    sut = null;
  });

  test("Usecase is of correct type.", () {
    //ASSERT
    expect(sut!, isA<GeneratePasswordUsecase>());
  });

  test("generates password of correct length.", () async {
    //ARRANGE
    const testInput = 100;
    const expectedResult = testInput;
    late final int result;

    //ACT
    await sut!
        .call(const GeneratePasswordParams(
          length: testInput,
          includeUpperCase: true,
          includeLowerCase: true,
          includeNumeric: true,
          includeSpecial: true,
        ))
        .then((value) => result = value.getOrElse(() => "").length);

    //ASSERT
    expect(result, expectedResult);
  });

  test("generates a password with only uppercase charaters.", () async {
    //ARRANGE
    final validator = RegExp(r'[A-Z]');
    late final String result;
    //ACT
    await sut!
        .call(const GeneratePasswordParams(
          length: 20,
          includeUpperCase: true,
          includeLowerCase: false,
          includeNumeric: false,
          includeSpecial: false,
        ))
        .then((value) => result = value.getOrElse(() => ""));

    //ASSERT
    expect(result.contains(validator), true);
  });

  test("generates a password with only lowercase charaters.", () async {
    //ARRANGE
    final validator = RegExp(r'[a-z]');
    late final String result;
    //ACT
    await sut!
        .call(const GeneratePasswordParams(
          length: 20,
          includeUpperCase: false,
          includeLowerCase: true,
          includeNumeric: false,
          includeSpecial: false,
        ))
        .then((value) => result = value.getOrElse(() => ""));

    //ASSERT
    expect(result.contains(validator), true);
  });

  test("generates a password with only numeric charaters.", () async {
    //ARRANGE
    final validator = RegExp(r'[0-9]');
    late final String result;
    //ACT
    await sut!
        .call(const GeneratePasswordParams(
          length: 20,
          includeUpperCase: false,
          includeLowerCase: false,
          includeNumeric: true,
          includeSpecial: false,
        ))
        .then((value) => result = value.getOrElse(() => ""));

    //ASSERT
    expect(result.contains(validator), true);
  });

//TODO: write correct regex to validate the test result.
  // test("generates a password with only special charaters.", () async {
  //   //ARRANGE
  //   // final validator = RegExp(r'''!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~ ''');
  //   final validator = RegExp(r'''^[\w&+:;=?@#|'<>.^*()%!-]+$''');
  //   // final validator = RegExp(r"\'");
  //   late final String result;
  //   //ACT
  //   await sut!
  //       .call(const GeneratePasswordParams(
  //         length: 20,
  //         includeUpperCase: false,
  //         includeLowerCase: false,
  //         includeNumeric: false,
  //         includeSpecial: true,
  //       ))
  //       .then((value) => result = value.getOrElse(() => ""));

  //   //ASSERT
  //   // expect(result.contains(validator), true);
  //   expect(validator.hasMatch(result), true);
  // });
}
