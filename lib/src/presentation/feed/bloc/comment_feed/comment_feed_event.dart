part of 'comment_feed_bloc.dart';

@freezed
class CommentFeedEvent with _$CommentFeedEvent {
  const factory CommentFeedEvent.getAllComments(String feedId) =
      _GetAllComments;
  const factory CommentFeedEvent.postComments() = _PostComments;
}
