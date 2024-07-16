import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:nowdots_social_news/src/data/models/feed_model.dart';

class FeedLocalDatasources {
  Future<Either<String, List<FeedModel>>> getLocalFeeds() async {
    try {
      final String response =
          await rootBundle.loadString("assets/data_dummy/dummy_feed.json");
      final data = jsonDecode(response).cast<Map<String, dynamic>>();
      List<FeedModel> feeds =
          data.map<FeedModel>((json) => FeedModel.fromJson(json)).toList();
      return Right(feeds);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
