import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:keysmith/src/core/common/entities/secrets_entity.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/core/utils/usecase/usecase.dart';
import 'package:keysmith/src/features/home/domain/usecases/usecases.dart';
import 'package:keysmith/src/features/home/presentation/states/cubits/secrets_list_state.dart';
import 'package:keysmith/src/features/home/presentation/states/models/secrets_list_model.dart';

@singleton
class SecretsListCubit extends Cubit<SecretsListState> {
  final FetchAllSecretsUsecase _fetchAllSecretsUsecase;
  final StreamAllSecretsUsecase _streamAllSecretsUsecase;
  final DeleteSecretsUsecase _deleteSecretsUsecase;
  final List<SecretsListModel> _tempSecretsList = [];

  ///Handles the stream of secret.
  ///Cancel this stream when closing this cubit.
  ///
  late final StreamSubscription<List<SecretsEntity>> _secretsStream;

  SecretsListCubit(
      {required FetchAllSecretsUsecase fetchAllSecretsUsecase,
      required StreamAllSecretsUsecase streamAllSecretsUsecase,
      required DeleteSecretsUsecase deleteSecretsUsecase})
      : _fetchAllSecretsUsecase = fetchAllSecretsUsecase,
        _streamAllSecretsUsecase = streamAllSecretsUsecase,
        _deleteSecretsUsecase = deleteSecretsUsecase,
        super(const SecretsListState()) {
    //TODO: temporary, replace this with the stream.
    getAllSecrets();
    //stream is tested
    // _startSecretsStream();
  }

  Future<void> getAllSecrets() async {
    emit(state.copyWith(appState: AppState.loading));
    final result = await _fetchAllSecretsUsecase.call(NoParams());
    result.fold(
        (failure) => emit(
            state.copyWith(appState: AppState.error, error: failure.message)),
        (secrets) =>
            emit(state.copyWith(appState: AppState.success, secrets: secrets)));

    log("from cubit: ${state.toString()}");
  }

  Future<void> _startSecretsStream() async {
    emit(state.copyWith(appState: AppState.loading));

    final result = await _streamAllSecretsUsecase.call(NoParams());

    result.fold(
      (error) => emit(
        state.copyWith(appState: AppState.error, error: error.message),
      ),
      (stream) => _secretsStream = stream.listen(
        (secrets) {
          emit(state.copyWith(
            appState: AppState.success,
            secrets: secrets
                .map(
                  (secret) => SecretsListModel.fromEntity(entity: secret),
                )
                .toList(),
          ));
        },
      )..onError(
          (error) => emit(state.copyWith(
              appState: AppState.error, error: error.toString())),
        ),
    );
  }

  void deleteSecret({required SecretsListModel secret}) =>
      _tempSecretsList.add(secret);

  void deleteAllSecrets() {
    _tempSecretsList.clear();
    _tempSecretsList.addAll(state.secrets);
  }

  void denyDeleteSecrets() => _tempSecretsList.clear();

  void confirmDeleteSecrets() async {
    emit(state.copyWith(appState: AppState.loading));

    final result = await _deleteSecretsUsecase.call(_tempSecretsList);

    result.fold(
      (failure) => emit(
          state.copyWith(appState: AppState.error, error: failure.message)),
      (_) {
        state.copyWith(appState: AppState.success);
        _tempSecretsList.clear();
      },
    );
  }

  @override
  Future<void> close() {
    _secretsStream.cancel();
    return super.close();
  }
}
