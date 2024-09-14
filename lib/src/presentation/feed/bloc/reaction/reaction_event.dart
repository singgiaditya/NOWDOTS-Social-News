part of 'reaction_bloc.dart';

@freezed
class ReactionEvent with _$ReactionEvent {
  const factory ReactionEvent.reaction(ReactionType reaction, String feedId) =
      _Reaction;
  const factory ReactionEvent.unReaction(ReactionType reaction, String feedId) =
      _UnReaction;
}
