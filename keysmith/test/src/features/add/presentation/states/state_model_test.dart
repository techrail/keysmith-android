import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/states/errors.dart';
import 'package:keysmith/src/features/add/presentation/states/state_model.dart';

void main() {
  //NOT A VALID TEST. Prints the json format in console for reference.
  test('Json serialisation works as intended.', () {
    //ARRANGE
    const testInput = AddPasswordState(
      status: AppState.success,
      title: 'SecretTitle',
      email: 'valid@email.com',
      password: 'password;',
      website: 'www.url.com',
      siteImageUrl: 'www.image.com',
      validEmail: true,
      validUrl: true,
      strength: 5,
      errors: {AddPasswordError.other: 'other error'},
    );

    final expectedResult = AddPasswordStateModel(
      status: testInput.status,
      title: testInput.title,
      email: testInput.email,
      password: testInput.password,
      website: testInput.website,
      siteImageUrl: testInput.siteImageUrl,
      validEmail: testInput.validEmail,
      validUrl: testInput.validUrl,
      strength: testInput.strength,
      errors: testInput.errors,
    ).toJson();

    //ACT
    debugPrint(expectedResult);
  });

  test('JSON de-serialisation works as intended.', () {
    //ARRANGE
    const AddPasswordState expectedResult = AddPasswordStateModel(
      status: AppState.success,
      title: 'SecretTitle',
      email: 'valid@email.com',
      password: 'password;',
      website: 'www.url.com',
      siteImageUrl: 'www.image.com',
      validEmail: true,
      validUrl: true,
      strength: 5,
      errors: {AddPasswordError.other: 'other error'},
    );

    final testInput = AddPasswordStateModel(
      status: expectedResult.status,
      title: expectedResult.title,
      email: expectedResult.email,
      password: expectedResult.password,
      website: expectedResult.website,
      siteImageUrl: expectedResult.siteImageUrl,
      validEmail: expectedResult.validEmail,
      validUrl: expectedResult.validUrl,
      strength: expectedResult.strength,
      errors: expectedResult.errors,
    ).toJson();

    //ACT
    final result = AddPasswordStateModel.fromJson(testInput);

    //ASSERT
    expect(result, expectedResult);
    expect(result, isA<AddPasswordState>());
  });
}
