part of 'get_all_feeds_bloc.dart';

@freezed
class GetAllFeedsState with _$GetAllFeedsState {
  const factory GetAllFeedsState.initial() = _Initial;
  const factory GetAllFeedsState.loading() = _Loading;
  const factory GetAllFeedsState.loaded(FeedsResponseModel data) = _Loaded;
  const factory GetAllFeedsState.error(String message) = _Error;
}
