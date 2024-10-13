part of 'comment_replies_bloc.dart';

@freezed
class CommentRepliesState with _$CommentRepliesState {
  const factory CommentRepliesState.initial() = _Initial;
  const factory CommentRepliesState.loading() = _Loading;
  const factory CommentRepliesState.loaded(RepliesResponseModel replies) = _Loaded;
  const factory CommentRepliesState.error(String message) = _Error;
}
