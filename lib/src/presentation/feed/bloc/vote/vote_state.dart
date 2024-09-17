part of 'vote_bloc.dart';

@freezed
class VoteState with _$VoteState {
  const factory VoteState.initial() = _Initial;
  const factory VoteState.loading() = _Loading;
  const factory VoteState.loaded() = _Loaded;
  const factory VoteState.error(String message) = _Error;
}
