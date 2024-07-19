import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/local/feed/feed_local_datasources.dart';
import 'package:nowdots_social_news/src/data/models/feeds_response_model.dart';

part 'get_all_feeds_event.dart';
part 'get_all_feeds_state.dart';
part 'get_all_feeds_bloc.freezed.dart';

class GetAllFeedsBloc extends Bloc<GetAllFeedsEvent, GetAllFeedsState> {
  final FeedLocalDatasources feedlocalDataSource;
  GetAllFeedsBloc(this.feedlocalDataSource) : super(const _Initial()) {
    on<GetAllFeedsEvent>((event, emit) async {
      emit(_Loading());
      final response = await feedlocalDataSource.getLocalFeeds();
      await Duration(seconds: 3);
      response.fold(
          (message) => emit(_Error(message)), (feeds) => emit(_Loaded(feeds)));
    });
  }
}
