part of 'reaction_bloc.dart';

@freezed
class ReactionState with _$ReactionState {
  const factory ReactionState.initial() = _Initial;
  const factory ReactionState.loading() = _Loading;
  const factory ReactionState.loaded() = _Loaded;
  const factory ReactionState.error(String message) = _Error;
}
