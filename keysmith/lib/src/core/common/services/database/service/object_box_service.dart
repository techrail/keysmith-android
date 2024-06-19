import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:keysmith/objectbox.g.dart';
import 'package:keysmith/src/core/common/services/database/dto/secrets_dto.dart';
import 'package:keysmith/src/core/common/services/database/model/secrets_dto_model.dart';
import 'package:keysmith/src/core/common/services/database/service/local_db_service.dart';
import 'package:objectbox/objectbox.dart' as objb;
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

  //TODO: TEST
  @override
  Future<Map<String, dynamic>> readSecret({required String id}) {
    if (int.tryParse(id) == null) {
      throw const FileSystemException("Invalid ID for ObjectBox object.");
    }

    final dbo = _passwordsBox
        .query(SecretsDTO_.id.equals(int.parse(id)))
        .build()
        .find()
        .first;

    final result = SecretDTOModel.fromDTO(dbo);

    return Future.value(result.toMap());
  }

  @override
  Future<List<Map<String, dynamic>>> readAllSecrets() async {
    final results = await _passwordsBox.getAllAsync();
    return results
        .map((dboSecret) => SecretDTOModel.fromDTO(dboSecret).toMap())
        .toList();
  }

  @override
  Future<Stream<List<Map<String, dynamic>>>> streamAllSecrets() {
    final query = _passwordsBox
        .query()
        .order(SecretsDTO_.createdAt, flags: objb.Order.descending);

    final dboStream =
        query.watch(triggerImmediately: true).map((query) => query.find());

    //Transform the database object (DBO) to a map.
    final StreamTransformer<List<SecretsDTO>, List<Map<String, dynamic>>>
        streamTransformer = StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        final List<Map<String, dynamic>> secretsMap = data
            .map((dboSecret) => SecretDTOModel.fromDTO(dboSecret).toMap())
            .toList();
        sink.add(secretsMap);
      },
      handleError: (error, stackTrace, sink) =>
          sink.addError('DB stream error: $error'),
      handleDone: (sink) => sink.close(),
    );

    return Future.value(streamTransformer.bind(dboStream));
  }

  //TODO: TEST
  @override
  Future<void> deleteSecret({required Map<String, dynamic> secret}) async {
    final dto = SecretDTOModel.fromMap(secret);
    await _passwordsBox.removeAsync(dto.id);
  }

  //TODO: TEST
  @override
  Future<void> deleteSecrets({required Map<String, dynamic> secrets}) async {
    await _passwordsBox.removeAllAsync();
  }
}
