import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';

class PasswordSecretEntity extends Equatable
    implements Copyable<PasswordSecretEntity> {
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
    required this.title,
    required this.email,
    required this.password,
    this.website = "",
    this.additionalInfo = const {},
  });

  @override
  List<Object> get props {
    return [
      title,
      email,
      password,
      website,
      additionalInfo,
    ];
  }

  @override
  PasswordSecretEntity copyWith({
    String? title,
    String? email,
    String? password,
    String? website,
    Map<String, String>? additionalInfo,
  }) {
    return PasswordSecretEntity(
      title: title ?? this.title,
      email: email ?? this.email,
      password: password ?? this.password,
      website: website ?? this.website,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }

  @override
  bool get stringify => true;

  @override
  PasswordSecretEntity copy() => PasswordSecretEntity(
        title: title,
        email: email,
        password: password,
        website: website,
        additionalInfo: additionalInfo,
      );
}
