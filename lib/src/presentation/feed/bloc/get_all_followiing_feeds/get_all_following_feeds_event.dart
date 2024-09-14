part of 'get_all_following_feeds_bloc.dart';

@freezed
class GetAllFollowingFeedsEvent with _$GetAllFollowingFeedsEvent {
  const factory GetAllFollowingFeedsEvent.started() = _Started;
  const factory GetAllFollowingFeedsEvent.getAllFollowingFeeds(FeedType type) =
      _GetAllFollowingFeeds;
}
