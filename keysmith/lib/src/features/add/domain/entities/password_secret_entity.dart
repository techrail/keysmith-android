part of 'package:keysmith/src/core/common/entities/secrets_entity.dart';

class PasswordSecretEntity extends SecretsEntity {
  ///Title of the secret.
  final String? title;

  ///The email ID for which the password is created for.
  ///
  final String email;

  ///Password of the secret
  ///
  final String password;

  ///Url of the website for which the secret is created for.
  ///
  final String? website;

  const PasswordSecretEntity({
    super.id,
    required super.createdAt,
    super.modifiedAt,
    super.additionalInfo,
    super.type = SecretType.password,
    required this.title,
    required this.email,
    required this.password,
    required this.website,
  });

  @override
  bool get stringify => true;

  @override
  PasswordSecretEntity copy() => PasswordSecretEntity(
        id: id,
        type: SecretType.password,
        title: title,
        email: email,
        password: password,
        website: website,
        createdAt: createdAt,
        modifiedAt: modifiedAt,
        additionalInfo: additionalInfo,
      );

  @override
  PasswordSecretEntity copyWith({
    int? id,
    SecretType? type,
    String? title,
    String? email,
    String? password,
    String? website,
    DateTime? createdAt,
    DateTime? modifiedAt,
    Map<String, String>? additionalInfo,
  }) {
    return PasswordSecretEntity(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      email: email ?? this.email,
      password: password ?? this.password,
      website: website ?? this.website,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      title,
      email,
      password,
      website,
      createdAt,
      modifiedAt,
      additionalInfo,
    ];
  }
}
