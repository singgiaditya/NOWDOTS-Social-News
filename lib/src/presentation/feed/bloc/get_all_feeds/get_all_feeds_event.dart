part of 'get_all_feeds_bloc.dart';

@freezed
class GetAllFeedsEvent with _$GetAllFeedsEvent {
  const factory GetAllFeedsEvent.started() = _Started;
  const factory GetAllFeedsEvent.getAllFeeds() = _GetAllFeeds;
}
