import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/prefs_key.dart';
import 'package:nowdots_social_news/src/data/models/comment/comments_response_model.dart';
import 'package:nowdots_social_news/src/data/models/comment/replies_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentFeedRemoteDatasources {
  final SharedPreferences prefs;
  CommentFeedRemoteDatasources(this.prefs);

  Future<Either<String, CommentsResponseModel>> getAllCommentDetailFeed(
      String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(commentDetailFeedApi(feedId));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        CommentsResponseModel data =
            CommentsResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, RepliesResponseModel>> getAllCommentReplies(
      String feedId, String commentId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(repliesCommentDetailFeedApi(feedId, commentId));
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        RepliesResponseModel data =
            RepliesResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }
}
