import 'dart:convert';

class RegisterVerificationCodeRequestModel {
  final String? email;
  final String? code;

  RegisterVerificationCodeRequestModel({
    this.email,
    this.code,
  });

  factory RegisterVerificationCodeRequestModel.fromRawJson(String str) =>
      RegisterVerificationCodeRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterVerificationCodeRequestModel.fromJson(
          Map<String, dynamic> json) =>
      RegisterVerificationCodeRequestModel(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
