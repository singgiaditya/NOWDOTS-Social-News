import 'dart:convert';

class RegisterSetPasswordRequestModel {
  final String? email;
  final String? password;

  RegisterSetPasswordRequestModel({
    this.email,
    this.password,
  });

  factory RegisterSetPasswordRequestModel.fromRawJson(String str) =>
      RegisterSetPasswordRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterSetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterSetPasswordRequestModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
