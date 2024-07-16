import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/data/datasources/local/feed/feed_local_datasources.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_news/get_feeds_event.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_news/get_feeds_state.dart';

class GetFeedsBloc extends Bloc<GetFeedsEvent, GetFeedsState> {
  final FeedLocalDatasources feedLocalDatasources;
  GetFeedsBloc(this.feedLocalDatasources) : super(GetFeedsLoading()) {
    on<GetFeeds>((event, emit) async {
      final feeds = await feedLocalDatasources.getLocalFeeds();
      feeds.fold((error) => emit(GetFeedsError(error: error)),
          (data) => emit(GetFeedsLoaded(feeds: data)));
    });
  }
}
