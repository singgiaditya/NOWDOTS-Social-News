part of 'comment_replies_bloc.dart';

@freezed
class CommentRepliesEvent with _$CommentRepliesEvent {
  const factory CommentRepliesEvent.getRepliesComment(String feedId, String commentId) = _GetRepliesComment;
}