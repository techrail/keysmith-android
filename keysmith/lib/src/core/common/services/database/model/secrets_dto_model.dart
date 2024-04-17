import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:keysmith/src/core/common/services/database/dto/secrets_dto.dart';
import 'package:keysmith/src/core/utils/constants/secret_type.dart';

class SecretDTOModel extends SecretsDTO {
  SecretDTOModel({
    required super.id,
    required super.secretType,
    required super.createdAt,
    required super.modifiedAt,
    required super.content,
  });

  Map<String, dynamic> toMap() {
    final SecretType? type = SecretType.getSecretFromString(secretType);

    if (type == null) {
      throw ErrorDescription("no 'secretType' found.");
    }
    //TODO: map the fields as per the secretType
    switch (type) {
      case SecretType.password:
        return <String, dynamic>{
          'id': id,
          'secretType': secretType,
          'createdAt': createdAt.millisecondsSinceEpoch,
          'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
          // 'content': json.decode(content)
          'title': (json.decode(content) as Map<String, dynamic>)['title'],
          'email': (json.decode(content) as Map<String, dynamic>)['email'],
          'password':
              (json.decode(content) as Map<String, dynamic>)['password'],
          'website': (json.decode(content) as Map<String, dynamic>)['website'],
        };
      case SecretType.note:
        throw UnimplementedError();
    }
    // return <String, dynamic>{
    //   'id': id,
    //   'secretType': secretType,
    //   'createdAt': createdAt.millisecondsSinceEpoch,
    //   'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
    //   'content': json.decode(content)
    // };
  }

  static SecretsDTO fromMap(Map<String, dynamic> map) {
    final SecretType? secretType = SecretType.getSecretFromMap(map);

    if (secretType == null) {
      throw ErrorDescription("no 'secretType' found.");
    }

    return SecretsDTO(
      id: map['id'] ?? 0,
      secretType: map['secretType'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      modifiedAt: map['modifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int)
          : null,
      content: switch (secretType) {
        SecretType.password => _passwordSecretMapper(map),
        // TODO: Handle this case.
        SecretType.note => throw UnimplementedError(),
      },
    );
  }

  static String _passwordSecretMapper(Map<String, dynamic> map) => json.encode({
        'title': map['title'] != null ? map['title'] as String : null,
        'email': map['email'] as String,
        'password': map['password'] as String,
        'website': map['website'] != null ? map['website'] as String : null,
      });
}
