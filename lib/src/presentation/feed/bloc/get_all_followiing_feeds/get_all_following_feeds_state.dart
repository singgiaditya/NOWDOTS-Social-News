part of 'get_all_following_feeds_bloc.dart';

@freezed
class GetAllFollowingFeedsState with _$GetAllFollowingFeedsState {
  const factory GetAllFollowingFeedsState.initial() = _Initial;
  const factory GetAllFollowingFeedsState.loading() = _Loading;
  const factory GetAllFollowingFeedsState.loaded(FeedsResponseModel data) = _Loaded;
  const factory GetAllFollowingFeedsState.error(String message) = _Error;
}
