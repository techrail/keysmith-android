import 'dart:async';

abstract interface class LocalSecretsDBService {
  ///Creates a new entry of secret.
  ///
  ///throws a [FileSystemException] if write isn't successful.
  Future<void> writeSecret({required Map<String, dynamic> secret});

  ///Fetches a single entry of secret for the given [id]
  ///
  ///throws a [FileSystemException] if read isn't successful.
  Future<Map<String, dynamic>> readSecret({required String id});

  ///Fetches all the entries of secrets.
  ///
  ///throws a [FileSystemException] if read isn't successful.
  ///
  Future<List<Map<String, dynamic>>> readAllSecrets();

  ///Creates a stream which is updated when secrets in
  ///database are modified.
  ///
  Future<Stream<Map<String, dynamic>>> streamAllSecrets();

  ///Deletes a secret, throws a [FileSystemException]
  ///if deletion isn't successful.
  ///
  void deleteSecret({required Map<String, dynamic> secret});

  ///Deletes secrets in batches, throws a [FileSystemException] if deletion isn't successful.
  ///
  void deleteSecrets({required Map<String, dynamic> secrets});
}
