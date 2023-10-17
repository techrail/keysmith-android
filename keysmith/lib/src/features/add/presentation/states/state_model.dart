import 'dart:convert';

import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_state.dart';
import 'package:keysmith/src/features/add/presentation/states/errors.dart';

class AddPasswordStateModel extends AddPasswordState {
  const AddPasswordStateModel({
    required super.status,
    required super.title,
    required super.email,
    required super.password,
    required super.website,
    required super.siteImageUrl,
    required super.validEmail,
    required super.validUrl,
    required super.strength,
    required super.errors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'title': title,
      'email': email,
      'password': password,
      'website': website,
      'siteImageUrl': siteImageUrl,
      'validEmail': validEmail,
      'validUrl': validUrl,
      'strength': strength,
      'errors': errors
          .map<String, String>((key, value) => MapEntry(key.toString(), value)),
    };
  }

  factory AddPasswordStateModel.fromMap(Map<String, dynamic> map) {
    return AddPasswordStateModel(
      status: AppState.getAppStateFromString(map['status']) ?? AppState.initial,
      title: map['title'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      website: map['website'] as String,
      siteImageUrl: map['siteImageUrl'] as String,
      validEmail: map['validEmail'] as bool,
      validUrl: map['validUrl'] as bool,
      strength: map['strength'] as int,
      errors: (map['errors'] as Map).map((key, value) => MapEntry(
          AddPasswordError.getAddPasswordErrorFromString(key) ??
              AddPasswordError.other,
          value as String)),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddPasswordStateModel.fromJson(String source) =>
      AddPasswordStateModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
