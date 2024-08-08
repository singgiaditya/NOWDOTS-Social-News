import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLogoutRemoteDataSources {
  final SharedPreferences prefs;
  LoginLogoutRemoteDataSources(this.prefs);

  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel requestData) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(loginApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);

      if (response.statusCode == 200) {
        LoginResponseModel data = LoginResponseModel.fromRawJson(response.body);
        await prefs.setString("token", data.token!);
        await prefs.setString("user", data.user!.toRawJson());
        return Right(data);
      }
      if (response.statusCode == 401) {
        return Left("Email/username or password incorrect");
      }
      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, String>> logout() async {
    try {
      var token = await prefs.getString("token");
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(logoutApi);
      var response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        prefs.clear();
        return Right("Success");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }
}
