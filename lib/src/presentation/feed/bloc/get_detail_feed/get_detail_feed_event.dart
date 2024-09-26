part of 'get_detail_feed_bloc.dart';

@freezed
class GetDetailFeedEvent with _$GetDetailFeedEvent {
  const factory GetDetailFeedEvent.getDetailFeed(String feedId) = _GetDetailFeed;
}
