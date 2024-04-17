// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';

///Describes the content of the expansion tile.
///
sealed class TileContentModel<T> extends Equatable implements Copyable<T> {}

///The content of the expansion tile for Passsword secretType.
///
class PasswordTileContentModel
    extends TileContentModel<PasswordTileContentModel> {
  ///The password of the secret.
  ///
  final String password;

  ///The website where this secret can be used.
  ///
  final String? website;

  PasswordTileContentModel({required this.password, this.website});

  @override
  List<Object?> get props => [password, website];

  @override
  PasswordTileContentModel copyWith({
    String? password,
    String? website,
  }) {
    return PasswordTileContentModel(
      password: password ?? this.password,
      website: website ?? this.website,
    );
  }

  @override
  PasswordTileContentModel copy() => PasswordTileContentModel(
        password: password,
        website: website,
      );
}

///The content of the expansion tile for Note secretType.
///
class NoteTileContentModel extends TileContentModel<NoteTileContentModel> {
  ///Body of the note, it can be empty.
  ///
  final String noteBody;

  NoteTileContentModel({required this.noteBody});

  @override
  List<Object> get props => [noteBody];

  @override
  NoteTileContentModel copyWith({
    String? noteBody,
  }) {
    return NoteTileContentModel(
      noteBody: noteBody ?? this.noteBody,
    );
  }

  @override
  NoteTileContentModel copy() => NoteTileContentModel(noteBody: noteBody);
}
