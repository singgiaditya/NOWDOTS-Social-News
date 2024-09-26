import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/prefs_key.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedRemoteDatasources {
  final SharedPreferences prefs;
  FeedRemoteDatasources(this.prefs);

  Future<Either<String, FeedsResponseModel>> getAllNowdotsFeed(
      FeedType type, bool isFollowing) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(typeToFeedApi(type, isFollowing));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        FeedsResponseModel data = FeedsResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      if (response.statusCode == 403) {
        return Left("This feature is only available for female users");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, Feed>> getDetailFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(detailFeedApi(feedId));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        Feed data = Feed.fromJson(jsonDecode(response.body)["data"]);
        return Right(data);
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  //return the correct feed link based on feed type
  String typeToFeedApi(FeedType type, bool isFollowing) {
    switch (type) {
      case FeedType.NOWDOTS:
        if (isFollowing) {
          return nowdotsFollowingFeedApi;
        }
        return nowdotsAllFeedApi;
      case FeedType.NOWHYPE:
        if (isFollowing) {
          return nowhypeFollowingFeedApi;
        }
        return nowhypeAllFeedApi;
      case FeedType.NOWFOODIE:
        if (isFollowing) {
          return nowfoodieFollowingFeedApi;
        }
        return nowfoodieAllFeedApi;
      case FeedType.NOWPLAY:
        if (isFollowing) {
          return nowplayFollowingFeedApi;
        }
        return nowplayAllFeedApi;
      case FeedType.NOWSPORT:
        if (isFollowing) {
          return nowsportsFollowingFeedApi;
        }
        return nowsportsAllFeedApi;
      case FeedType.NOWHER:
        if (isFollowing) {
          return nowherFollowingFeedApi;
        }
        return nowherAllFeedApi;
      default:
        return nowdotsAllFeedApi;
    }
  }
}
