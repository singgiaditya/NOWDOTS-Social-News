part of 'vote_bloc.dart';

@freezed
class VoteEvent with _$VoteEvent {
  const factory VoteEvent.vote(VoteType voteType, String feedId) = _Vote;
  const factory VoteEvent.unVote(VoteType voteType, String feedId) = _UnVote;
}
