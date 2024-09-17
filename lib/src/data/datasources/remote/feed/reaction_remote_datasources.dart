import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/prefs_key.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/data/models/reaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ReactionRemoteDatasources {
  final SharedPreferences prefs;
  ReactionRemoteDatasources(this.prefs);

  Future<Either<String, ReactionModel>> reactionFeed(
      String feedId, ReactionType reaction) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var body = {
        "tag": reaction.name.toLowerCase(),
      };
      var uri = Uri.parse(reactionFeedApi(feedId));
      var response =
          await http.post(uri, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200) {
        ReactionModel data = ReactionModel(tag: reaction);
        return Right(data);
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> unReactionFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(reactionFeedApi(feedId));
      var response = await http.delete(uri, headers: headers);
      if (response.statusCode == 200) {
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> reactionDislikeFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(reactionDislikeFeedApi(feedId));
      var response = await http.post(uri, headers: headers);
      if (response.statusCode == 200) {
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> unReactionDislikeFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(reactionDislikeFeedApi(feedId));
      var response = await http.delete(uri, headers: headers);
      if (response.statusCode == 200) {
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }
}
