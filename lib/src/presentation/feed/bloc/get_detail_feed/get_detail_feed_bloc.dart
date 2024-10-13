import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nowdots_social_news/src/data/datasources/remote/feed/feed_remote_datasources.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';

part 'get_detail_feed_event.dart';
part 'get_detail_feed_state.dart';
part 'get_detail_feed_bloc.freezed.dart';

class GetDetailFeedBloc extends Bloc<GetDetailFeedEvent, GetDetailFeedState> {
  final FeedRemoteDatasources feedRemoteDatasources;
  GetDetailFeedBloc(this.feedRemoteDatasources) : super(_Initial()) {
    on<_GetDetailFeed>((event, emit) async {
      emit(_Loading());
      final result = await feedRemoteDatasources.getDetailFeed(event.feedId);
      result.fold(
          (message) => emit(_Error(message)), (data) => emit(_Loaded(data)));
    });
  }
}
