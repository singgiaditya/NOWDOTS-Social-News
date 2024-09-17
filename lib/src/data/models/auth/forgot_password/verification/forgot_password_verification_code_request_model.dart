import 'dart:convert';

class ForgotPasswordVerificationCodeRequestModel {
  final String? email;
  final String? code;

  ForgotPasswordVerificationCodeRequestModel({
    this.email,
    this.code,
  });

  factory ForgotPasswordVerificationCodeRequestModel.fromRawJson(String str) =>
      ForgotPasswordVerificationCodeRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordVerificationCodeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ForgotPasswordVerificationCodeRequestModel(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
