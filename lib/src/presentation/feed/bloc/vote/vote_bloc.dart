import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/vote_remote_datasources.dart';

part 'vote_event.dart';
part 'vote_state.dart';
part 'vote_bloc.freezed.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  final VoteRemoteDatasources voteRemoteDatasources;
  VoteBloc(this.voteRemoteDatasources) : super(_Initial()) {
    on<_Vote>((event, emit) async {
      emit(_Loading());
      if (event.voteType == VoteType.DOWN) {
        var result = await voteRemoteDatasources.downVoteFeed(event.feedId);
        result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
        return;
      }
      var result = await voteRemoteDatasources.upVoteFeed(event.feedId);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
    });
    on<_UnVote>((event, emit) async {
      emit(_Loading());
      if (event.voteType == VoteType.DOWN) {
        var result = await voteRemoteDatasources.unDownVoteFeed(event.feedId);
        result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
        return;
      }
      var result = await voteRemoteDatasources.unUpVoteFeed(event.feedId);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded()));
    });
  }
}
