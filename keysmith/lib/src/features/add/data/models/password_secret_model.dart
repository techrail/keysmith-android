// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:keysmith/src/features/add/domain/entities/password_secret_entity.dart';

class PasswordSecretModel extends PasswordSecretEntity {
  const PasswordSecretModel({
    required super.id,
    required super.title,
    required super.email,
    required super.password,
    required super.website,
    required super.additionalInfo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'email': email,
      'password': password,
      'website': website,
      'additionalInfo': additionalInfo,
    };
  }

  factory PasswordSecretModel.fromMap(Map<String, dynamic> map) {
    return PasswordSecretModel(
        id: map['id'] as String,
        title: map['title'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        website: map['website'] as String,
        additionalInfo: Map<String, String>.from(
          (map['additionalInfo'] as Map<String, String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PasswordSecretModel.fromJson(String source) =>
      PasswordSecretModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
