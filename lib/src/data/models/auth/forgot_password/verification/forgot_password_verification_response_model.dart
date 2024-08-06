import 'dart:convert';

class ForgotPasswordVerificationCodeResponseModel {
  final String? status;
  final String? email;
  final String? message;

  ForgotPasswordVerificationCodeResponseModel({
    this.status,
    this.email,
    this.message,
  });

  factory ForgotPasswordVerificationCodeResponseModel.fromRawJson(String str) =>
      ForgotPasswordVerificationCodeResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordVerificationCodeResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ForgotPasswordVerificationCodeResponseModel(
        status: json["status"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "email": email,
        "message": message,
      };
}
