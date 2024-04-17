// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:keysmith/src/core/common/entities/secrets_entity.dart';

class PasswordSecretModel extends PasswordSecretEntity {
  const PasswordSecretModel({
    required super.id,
    required super.email,
    required super.password,
    required super.createdAt,
    super.modifiedAt,
    super.title,
    super.website,
    super.additionalInfo,
  });

//TODO: and any extra field in the 'additional info' map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'email': email,
      'secretType': type.name,
      'password': password,
      'website': website,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
    };
  }

//TODO: and any extra field in the 'additional info' map.
  factory PasswordSecretModel.fromMap(Map<String, dynamic> map) {
    return PasswordSecretModel(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      email: map['email'] as String,
      password: map['password'] as String,
      website: map['website'] != null ? map['website'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      modifiedAt: (map['modifiedAt'] != null)
          ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int)
          : null,
      additionalInfo: const {},
    );
  }

  String toJson() => json.encode(toMap());

  factory PasswordSecretModel.fromJson(String source) =>
      PasswordSecretModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
