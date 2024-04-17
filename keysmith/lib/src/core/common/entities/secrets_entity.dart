import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/constants/secret_type.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';

part 'package:keysmith/src/features/add/domain/entities/password_secret_entity.dart';

sealed class SecretsEntity<T> extends Equatable implements Copyable<T> {
  final int? id;

  final SecretType type;

  final DateTime createdAt;

  final DateTime? modifiedAt;

  ///Additional information which may be required with this
  ///secret.
  ///
  final Map<String, dynamic>? additionalInfo;

  const SecretsEntity({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.modifiedAt,
    this.additionalInfo = const {},
  });
}
