import 'package:dartz/dartz.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/prefs_key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VoteRemoteDatasources {
  final SharedPreferences prefs;
  VoteRemoteDatasources(this.prefs);

  Future<Either<String, String>> upVoteFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(upVoteFeedApi(feedId));
      var response = await http.post(uri, headers: headers);
      if (response.statusCode == 200) {
        String data = "Success Upvote";
        return Right(data);
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> unUpVoteFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(upVoteFeedApi(feedId));
      var response = await http.delete(uri, headers: headers);
      if (response.statusCode == 200) {
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> downVoteFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(downVoteFeedApi(feedId));
      var response = await http.post(uri, headers: headers);
      if (response.statusCode == 200) {
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Something went wrong");
    }
  }

  Future<Either<String, String>> unDownVoteFeed(String feedId) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(downVoteFeedApi(feedId));
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
