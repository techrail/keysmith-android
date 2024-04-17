// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:keysmith/src/core/utils/state/app_state.dart';
import 'package:keysmith/src/core/utils/usecase/copyable.dart';
import 'package:keysmith/src/features/home/presentation/states/models/secrets_list_model.dart';

///State for secrets list view.
///
class SecretsListState extends Equatable implements Copyable<SecretsListState> {
  ///State of the view
  ///
  final AppState appState;

  //TODO: there will be more types of secrets.
  /// Secrets to be displayed on the list.
  ///
  final List<SecretsListModel> secrets;

  ///The index of the of the tile which is currently expanded.
  ///When no tile is expanded, [expandedIndex] will be null.
  ///
  final int? expandedIndex;

  final String? error;

  const SecretsListState({
    this.appState = AppState.initial,
    this.secrets = const [],
    this.expandedIndex,
    this.error,
  });

  @override
  List<Object?> get props => [appState, secrets, error];

  @override
  SecretsListState copyWith({
    AppState? appState,
    List<SecretsListModel>? secrets,
    int? expandedIndex,
    String? error,
  }) {
    return SecretsListState(
        appState: appState ?? this.appState,
        secrets: secrets ?? this.secrets,
        expandedIndex: expandedIndex ?? this.expandedIndex,
        error: error ?? this.error);
  }

  @override
  SecretsListState copy() => SecretsListState(
        appState: appState,
        secrets: secrets,
        expandedIndex: expandedIndex,
        error: error,
      );
}
