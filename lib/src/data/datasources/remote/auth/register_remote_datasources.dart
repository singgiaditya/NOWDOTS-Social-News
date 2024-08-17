import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/prefs_key.dart';
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
import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRemoteDataSources {
  final SharedPreferences prefs;
  RegisterRemoteDataSources(this.prefs);

  Future<Either<String, CreateAccountResponseModel>> createAccount(
      CreateAccountRequestModel requestData) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(createAccountApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);

      if (response.statusCode == 200) {
        CreateAccountResponseModel data =
            CreateAccountResponseModel.fromRawJson(response.body);
        await prefs.setString(tokenPrefs, data.token!);
        return Right(data);
      }
      if (response.statusCode == 401) {
        return Left("Email already exist");
      }
      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterVerificationCodeResponseModel>>
      verificationCode(RegisterVerificationCodeRequestModel requestData) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerVerificationCodeApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      if (response.statusCode == 200) {
        RegisterVerificationCodeResponseModel data =
            RegisterVerificationCodeResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      if (response.statusCode == 401) {
        return Left("Invalid verification code");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetPasswordResponseModel>> setPassword(
      RegisterSetPasswordRequestModel requestData) async {
    try {
      var token = await prefs.getString("token");
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetPasswordApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      if (response.statusCode == 200) {
        RegisterSetPasswordResponseModel data =
            RegisterSetPasswordResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      if (response.statusCode == 422) {
        Left("Make sure you fill in all the required fields");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetProfilePictureResponseModel>>
      setProfilePicture(
          RegisterSetProfilePictureRequestModel requestData) async {
    try {
      var token = await prefs.getString(tokenPrefs);
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

      if (response.statusCode == 200) {
        RegisterSetProfilePictureResponseModel data =
            RegisterSetProfilePictureResponseModel.fromRawJson(result);
        return Right(data);
      }

      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }

      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, RegisterSetProfilePictureResponseModel>>
      skipProfilePicture(String email) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetProfilePictureApi);
      var response =
          await http.post(uri, body: {"email": email}, headers: headers);

      if (response.statusCode == 200) {
        RegisterSetProfilePictureResponseModel data =
            RegisterSetProfilePictureResponseModel.fromRawJson(response.body);
        return Right(data);
      }

      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }

      return Left("Something went wrong");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, RegisterSetUsernameUserResponseModel>> setUsername(
      RegisterSetUsernameUserRequestModel requestData) async {
    try {
      var token = await prefs.getString(tokenPrefs);
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var uri = Uri.parse(registerSetUsernameApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);
      if (response.statusCode == 200) {
        RegisterSetUsernameUserResponseModel data =
            RegisterSetUsernameUserResponseModel.fromRawJson(response.body);
        UserModel user = UserModel.fromJson(data.data!.toJson());
        prefs.setString(userPrefs, user.toRawJson());
        return Right(data);
      }

      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }

      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }
}
