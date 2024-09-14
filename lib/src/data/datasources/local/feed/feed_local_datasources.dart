import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';

class FeedLocalDatasources {
  Future<Either<String, FeedsResponseModel>> getLocalFeeds() async {
    try {
      final String response =
          await rootBundle.loadString("assets/data_dummy/dummy_feed.json");
      final data = FeedsResponseModel.fromRawJson(response);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
