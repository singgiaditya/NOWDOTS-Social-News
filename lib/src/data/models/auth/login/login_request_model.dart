import 'dart:convert';

class LoginRequestModel {
  final String? emailOrUsername;
  final String? password;

  LoginRequestModel({
    this.emailOrUsername,
    this.password,
  });

  factory LoginRequestModel.fromRawJson(String str) =>
      LoginRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        emailOrUsername: json["emailOrUsername"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "emailOrUsername": emailOrUsername,
        "password": password,
      };
}
