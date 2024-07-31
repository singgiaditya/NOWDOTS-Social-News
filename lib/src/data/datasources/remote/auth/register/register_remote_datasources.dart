import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/create_account/create_account_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/create_account/create_account_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_password/register_set_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_password/register_set_password_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_profile_picture/register_set_profile_picture_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_profile_picture/register_set_profile_picture_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_username_user/register_set_username_user_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_username_user/register_set_username_user_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/verification_code/register_verification_code_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/verification_code/register_verification_code_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRemoteDataSources {
  Future<Either<String, CreateAccountResponseModel>> createAccount(
      CreateAccountRequestModel requestData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(createAccountApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      CreateAccountResponseModel data =
          CreateAccountResponseModel.fromRawJson(response.body);

      if (data.data == null) {
        return Left(data.message!);
      }
      await prefs.setString("token", data.token!);
      return Right(data);
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterVerificationCodeResponseModel>>
      verificationCode(RegisterVerificationCodeRequestModel requestData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString("token");
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerVerificationCodeApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      RegisterVerificationCodeResponseModel data =
          RegisterVerificationCodeResponseModel.fromRawJson(response.body);

      if (data.data == null) {
        return Left(data.message!);
      }
      return Right(data);
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetPasswordResponseModel>> setPassword(
      RegisterSetPasswordRequestModel requestData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString("token");
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetPasswordApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      RegisterSetPasswordResponseModel data =
          RegisterSetPasswordResponseModel.fromRawJson(response.body);

      if (data.data == null) {
        return Left(data.message!);
      }
      return Right(data);
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetProfilePictureResponseModel>>
      setProfilePicture(
          RegisterSetProfilePictureRequestModel requestData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString("token");
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetProfilePictureApi);
      var request = http.MultipartRequest("POST", uri);
      request.fields.addAll({"email": requestData.email!});
      request.files.add(
          await http.MultipartFile.fromPath('image', requestData.image!.path));
      request.headers.addAll(headers);
      var response = await request.send();
      var result = await response.stream.bytesToString();
      RegisterSetProfilePictureResponseModel data =
          RegisterSetProfilePictureResponseModel.fromRawJson(result);

      if (data.data == null) {
        print(result);
        return Left(data.message!);
      }
      return Right(data);
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetUsernameUserResponseModel>> setUsername(
      RegisterSetUsernameUserRequestModel requestData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString("token");
      print(token);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetUsernameApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      RegisterSetUsernameUserResponseModel data =
          RegisterSetUsernameUserResponseModel.fromRawJson(response.body);

      if (data.data == null) {
        return Left(data.message!);
      }
      return Right(data);
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }
}
