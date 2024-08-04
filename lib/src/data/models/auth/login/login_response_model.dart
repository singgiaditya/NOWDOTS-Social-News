import 'dart:convert';

import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';

class LoginResponseModel {
  final String? token;
  final UserModel? user;

  LoginResponseModel({
    this.token,
    this.user,
  });

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["token"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}