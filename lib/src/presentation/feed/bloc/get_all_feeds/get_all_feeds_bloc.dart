import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/feed_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';

part 'get_all_feeds_event.dart';
part 'get_all_feeds_state.dart';
part 'get_all_feeds_bloc.freezed.dart';

class GetAllFeedsBloc extends Bloc<GetAllFeedsEvent, GetAllFeedsState> {
  final FeedRemoteDatasources feedRemoteDataSource;
  FeedType feedType = FeedType.NOWDOTS;
  GetAllFeedsBloc(this.feedRemoteDataSource) : super(const _Initial()) {
    on<_GetAllFeeds>((event, emit) async {
      emit(const _Loading());
      final response =
          await feedRemoteDataSource.getAllNowdotsFeed(feedType, false);
      response.fold(
          (message) => emit(_Error(message)), (feeds) => emit(_Loaded(feeds)));
    });
    on<_ChangeFeeds>((event, emit) async {
      try {
        emit(const _Loading());
        feedType = event.type;
        final response =
            await feedRemoteDataSource.getAllNowdotsFeed(feedType, false);
        response.fold((message) => emit(_Error(message)),
            (feeds) => emit(_Loaded(feeds)));
      } on Exception catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
