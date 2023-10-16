// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';

class PasswordSecretEntity extends Equatable
    implements Copyable<PasswordSecretEntity> {
  final String id;

  ///Title of the secret.
  final String title;

  ///The email ID for which the password is created for.
  ///
  final String email;

  ///Password of the secret
  ///
  final String password;

  ///Url of the website for which the secret is created for.
  ///
  final String website;

  ///Additional information which may be required with this
  ///secret.
  ///
  final Map<String, String> additionalInfo;

  const PasswordSecretEntity({
    required this.id,
    required this.title,
    required this.email,
    required this.password,
    required this.website,
    required this.additionalInfo,
  });

  @override
  bool get stringify => true;

  @override
  PasswordSecretEntity copy() => PasswordSecretEntity(
        id: id,
        title: title,
        email: email,
        password: password,
        website: website,
        additionalInfo: additionalInfo,
      );

  @override
  PasswordSecretEntity copyWith({
    String? id,
    String? title,
    String? email,
    String? password,
    String? website,
    Map<String, String>? additionalInfo,
  }) {
    return PasswordSecretEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      email: email ?? this.email,
      password: password ?? this.password,
      website: website ?? this.website,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      email,
      password,
      website,
      additionalInfo,
    ];
  }
}
