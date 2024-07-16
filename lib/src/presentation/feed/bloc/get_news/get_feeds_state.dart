import 'package:equatable/equatable.dart';
import 'package:nowdots_social_news/src/data/models/feed_model.dart';

abstract class GetFeedsState extends Equatable {
  final List<FeedModel>? feeds;
  final String ? error;
  const GetFeedsState({this.feeds, this.error});

  @override
  List<Object?> get props => [feeds, error];
}

class GetFeedsLoading extends GetFeedsState {
  const GetFeedsLoading();
}

class GetFeedsLoaded extends GetFeedsState {
  const GetFeedsLoaded({super.feeds});
}

class GetFeedsError extends GetFeedsState {
  const GetFeedsError({super.error});
}
