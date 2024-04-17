import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:keysmith/objectbox.g.dart';
import 'package:keysmith/src/core/common/services/database/dto/secrets_dto.dart';
import 'package:keysmith/src/core/common/services/database/model/secrets_dto_model.dart';
import 'package:keysmith/src/core/common/services/database/service/local_db_service.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

@Singleton(as: LocalSecretsDBService)
class ObjectBoxService implements LocalSecretsDBService {
  ///The database of this app.
  ///
  late final Store _store;

  late final Box<SecretsDTO> _passwordsBox;

  ///Creates an instance of this service.
  ///
  ObjectBoxService._create(this._store) {
    _passwordsBox = _store.box<SecretsDTO>();
  }

  ///Retrieves the database from the document directory of this app.
  ///
  @factoryMethod
  static Future<ObjectBoxService> create() async {
    final directory = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: path.join(directory.path, "keysmith"));
    return ObjectBoxService._create(store);
  }

  @override
  Future<void> writeSecret({required Map<String, dynamic> secret}) async {
    try {
      await _passwordsBox.putAsync(SecretDTOModel.fromMap(secret));
    } catch (error) {
      log(error.toString());
      throw FileSystemException(error.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> readSecret({required String id}) {
    // TODO: implement readSecret
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> readAllSecrets() async {
    final results = await _passwordsBox.getAllAsync();
    //TODO: decode this data into a list of map, implement SecretsDTOModel
    log(results.toString());
    //TODO: return the decoded data
    return results
        .map(
          (dto) => SecretDTOModel(
            id: dto.id,
            secretType: dto.secretType,
            createdAt: dto.createdAt,
            modifiedAt: dto.modifiedAt,
            content: dto.content,
          ).toMap(),
        )
        .toList();

    // throw UnimplementedError();
  }

  @override
  Future<Stream<Map<String, dynamic>>> streamAllSecrets() {
    // TODO: implement streamAllSecrets
    throw UnimplementedError();
  }

  @override
  void deleteSecret({required Map<String, dynamic> secret}) {
    // TODO: implement deleteSecret
    throw UnimplementedError();
  }

  @override
  void deleteSecrets({required Map<String, dynamic> secrets}) {
    // TODO: implement deleteSecrets
    throw UnimplementedError();
  }
}
