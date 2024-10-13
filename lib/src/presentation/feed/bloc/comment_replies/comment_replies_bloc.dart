import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/comment_feed_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/comment/replies_response_model.dart';

part 'comment_replies_event.dart';
part 'comment_replies_state.dart';
part 'comment_replies_bloc.freezed.dart';

class CommentRepliesBloc
    extends Bloc<CommentRepliesEvent, CommentRepliesState> {
  final CommentFeedRemoteDatasources commentFeedRemoteDatasources;
  CommentRepliesBloc(this.commentFeedRemoteDatasources) : super(_Initial()) {
    on<_GetRepliesComment>((event, emit) async {
      emit(_Loading());
      final result = await commentFeedRemoteDatasources.getAllCommentReplies(
          event.feedId, event.commentId);
      result.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
