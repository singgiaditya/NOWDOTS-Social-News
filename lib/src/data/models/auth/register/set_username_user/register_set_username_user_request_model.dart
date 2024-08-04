import 'dart:convert';

class RegisterSetUsernameUserRequestModel {
  final String? email;
  final String? username;

  RegisterSetUsernameUserRequestModel({
    this.email,
    this.username,
  });

  factory RegisterSetUsernameUserRequestModel.fromRawJson(String str) =>
      RegisterSetUsernameUserRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterSetUsernameUserRequestModel.fromJson(
          Map<String, dynamic> json) =>
      RegisterSetUsernameUserRequestModel(
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
      };
}
