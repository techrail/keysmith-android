// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/constants/secret_type.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';
import 'package:keysmith/src/features/home/presentation/states/models/tile_content_model.dart';

class SecretsListModel extends Equatable implements Copyable<SecretsListModel> {
  /// ID of the secret.
  final int id;

  /// Time at which this secret was created.
  final DateTime createdAt;

  ///The type of secret.
  ///
  final SecretType type;

  ///Url of the image to displayed as thumbnail.
  final String? thumbnail;

  ///The text which will displayed in the tile's title.
  ///
  final String title;

  ///The text which will displayed in the tile's subtitle.
  ///
  final String? subTitle;

  //we don't know how the content will look for different [SecretType]

  //The style of cotent will be different for each SecretType

  ///the content of the secret that will be displayed when the
  ///tile is expanded.
  final TileContentModel content;

  const SecretsListModel({
    required this.id,
    required this.createdAt,
    required this.type,
    required this.title,
    this.thumbnail,
    this.subTitle,
    required this.content,
  });

  SecretsEntity toEntity() => switch (type) {
        SecretType.password => PasswordSecretEntity(
            title: subTitle != null ? title : null,
            email: subTitle == null ? title : subTitle!,
            password: (content as PasswordTileContentModel).password,
            website: (content as PasswordTileContentModel).website,
            createdAt: createdAt,
            additionalInfo: null,
          ),
        //TODO: update when note entity is implemented
        SecretType.note => throw UnimplementedError(),
      };

  static SecretsListModel fromEntity({required SecretsEntity entity}) =>
      SecretsListModel(
        id: entity.id ?? 0,
        createdAt: entity.createdAt,
        type: entity.type,
        title: switch (entity) {
          PasswordSecretEntity(title: final title, email: final email) =>
            title ?? email
        },
        subTitle: switch (entity) {
          PasswordSecretEntity(title: final title, email: final email) =>
            title == null ? null : email,
        },
        content: switch (entity) {
          PasswordSecretEntity(
            password: final password,
            website: final website
          ) =>
            PasswordTileContentModel(password: password, website: website),
        },
      );

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      type,
      thumbnail,
      title,
      subTitle,
      content,
    ];
  }

  @override
  SecretsListModel copyWith({
    int? id,
    DateTime? createdAt,
    SecretType? type,
    String? thumbnail,
    String? title,
    String? subTitle,
    TileContentModel? content,
  }) {
    return SecretsListModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      content: content ?? this.content,
    );
  }

  @override
  SecretsListModel copy() => SecretsListModel(
        id: id,
        createdAt: createdAt,
        type: type,
        thumbnail: thumbnail,
        title: title,
        content: content,
      );
}
