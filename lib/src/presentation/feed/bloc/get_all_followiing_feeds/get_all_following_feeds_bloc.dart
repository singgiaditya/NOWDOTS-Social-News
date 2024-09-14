import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/feed_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';

part 'get_all_following_feeds_event.dart';
part 'get_all_following_feeds_state.dart';
part 'get_all_following_feeds_bloc.freezed.dart';

class GetAllFollowingFeedsBloc
    extends Bloc<GetAllFollowingFeedsEvent, GetAllFollowingFeedsState> {
  final FeedRemoteDatasources feedRemoteDataSource;
  GetAllFollowingFeedsBloc(this.feedRemoteDataSource) : super(_Initial()) {
    on<_GetAllFollowingFeeds>((event, emit) async {
      emit(const _Loading());
      final response =
          await feedRemoteDataSource.getAllNowdotsFeed(event.type, true);
      response.fold(
          (message) => emit(_Error(message)), (feeds) => emit(_Loaded(feeds)));
    });
  }
}
