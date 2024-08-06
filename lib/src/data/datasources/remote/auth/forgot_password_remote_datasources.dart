import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/forgot_pass/forgot_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/forgot_pass/forgot_password_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/set_new_password/forgot_password_set_new_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/set_new_password/forgot_password_set_new_password_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/verification/forgot_password_verification_code_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/verification/forgot_password_verification_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordRemoteDataSources {
  final SharedPreferences prefs;
  ForgotPasswordRemoteDataSources(this.prefs);

  Future<Either<String, ForgotPasswordResponseModel>> forgotPass(
      ForgotPasswordRequestModel requestData) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(forgotPasswordApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);

      if (response.statusCode == 200) {
        ForgotPasswordResponseModel data =
            ForgotPasswordResponseModel.fromRawJson(response.body);
        return Right(data);
      }
      if (response.statusCode == 401) {
        return Left("Email/username invalid");
      }
      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, ForgotPasswordVerificationCodeResponseModel>>
      verificationCode(
          ForgotPasswordVerificationCodeRequestModel requestData) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(forgotVerificationCodeApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);

      if (response.statusCode == 200) {
        ForgotPasswordVerificationCodeResponseModel data =
            ForgotPasswordVerificationCodeResponseModel.fromRawJson(
                response.body);
        return Right(data);
      }

      if (response.statusCode == 401) {
        return Left("Invalid verification code");
      }

      if (response.statusCode == 422) {
        return Left("Make sure you fill in all the required fields");
      }
      return Left("Something went wrong");
    } catch (e) {
      return Left("Please check your internet connection");
    }
  }

  Future<Either<String, ForgotPasswordSetNewPasswordResponseModel>>
      setNewPassword(
          ForgotPasswordSetNewPasswordRequestModel requestData) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var uri = Uri.parse(forgotPasswordSetNewPasswordApi);
      var response =
          await http.post(uri, body: requestData.toRawJson(), headers: headers);

      if (response.statusCode == 200) {
        ForgotPasswordSetNewPasswordResponseModel data =
            ForgotPasswordSetNewPasswordResponseModel.fromRawJson(
                response.body);
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
