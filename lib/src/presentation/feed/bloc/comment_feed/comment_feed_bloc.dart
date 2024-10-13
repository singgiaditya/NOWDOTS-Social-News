import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/comment_feed_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/comment/comments_response_model.dart';

part 'comment_feed_event.dart';
part 'comment_feed_state.dart';
part 'comment_feed_bloc.freezed.dart';

class CommentFeedBloc extends Bloc<CommentFeedEvent, CommentFeedState> {
  final CommentFeedRemoteDatasources commentFeedRemoteDatasources;

  CommentFeedBloc(this.commentFeedRemoteDatasources) : super(_Initial()) {
    on<_GetAllComments>((event, emit) async {
      emit(_Loading());
      final result = await commentFeedRemoteDatasources
          .getAllCommentDetailFeed(event.feedId);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
