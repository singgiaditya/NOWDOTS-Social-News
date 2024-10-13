part of 'get_detail_feed_bloc.dart';

@freezed
class GetDetailFeedState with _$GetDetailFeedState {
  const factory GetDetailFeedState.initial() = _Initial;
  const factory GetDetailFeedState.loading() = _Loading;
  const factory GetDetailFeedState.loaded(Feed data) = _Loaded;
  const factory GetDetailFeedState.error(String message) = _Error;
}
