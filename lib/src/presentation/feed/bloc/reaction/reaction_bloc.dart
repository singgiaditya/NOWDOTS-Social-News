import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/reaction_remote_datasources.dart';

part 'reaction_event.dart';
part 'reaction_state.dart';
part 'reaction_bloc.freezed.dart';

class ReactionBloc extends Bloc<ReactionEvent, ReactionState> {
  final ReactionRemoteDatasources reactionRemoteDatasources;
  ReactionBloc(this.reactionRemoteDatasources) : super(_Initial()) {
    on<_Reaction>((event, emit) async {
      emit(_Loading());
      if (event.reaction == ReactionType.BAD) {
        var result =
            await reactionRemoteDatasources.reactionDislikeFeed(event.feedId);
        result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
        return;
      }
      var result = await reactionRemoteDatasources.reactionFeed(
          event.feedId, event.reaction);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
    });
    on<_UnReaction>((event, emit) async {
      emit(_Loading());
      if (event.reaction == ReactionType.BAD) {
        var result =
            await reactionRemoteDatasources.unReactionDislikeFeed(event.feedId);
        result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
        return;
      }
      var result = await reactionRemoteDatasources.unReactionFeed(event.feedId);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
    });
  }
}
