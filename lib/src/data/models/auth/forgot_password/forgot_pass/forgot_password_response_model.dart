import 'dart:convert';

class ForgotPasswordResponseModel {
  final String? status;
  final String? email;
  final String? message;

  ForgotPasswordResponseModel({
    this.status,
    this.email,
    this.message,
  });

  factory ForgotPasswordResponseModel.fromRawJson(String str) =>
      ForgotPasswordResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponseModel(
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
