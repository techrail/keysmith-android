import 'package:objectbox/objectbox.dart';

@Entity()
class SecretsDTO {
  int id;

  final String secretType;

  final DateTime createdAt;

  final DateTime? modifiedAt;

  final String content;

  SecretsDTO({
    required this.id,
    required this.secretType,
    required this.createdAt,
    this.modifiedAt,
    required this.content,
  });

  @override
  String toString() =>
      'SecretsDTO(id: $id, secretType: $secretType, createdAt: $createdAt, modifiedAt: $modifiedAt, content: $content)';
}
