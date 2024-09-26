part of 'comment_feed_bloc.dart';

@freezed
class CommentFeedState with _$CommentFeedState {
  const factory CommentFeedState.initial() = _Initial;
  const factory CommentFeedState.loading() = _Loading;
  const factory CommentFeedState.loaded(CommentsResponseModel comment) =
      _Loaded;
  const factory CommentFeedState.error(String message) = _Error;
}
