import 'dart:convert';

class ForgotPasswordSetNewPasswordRequestModel {
  final String? email;
  final String? password;
  final String? passwordConfirmation;

  ForgotPasswordSetNewPasswordRequestModel({
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  factory ForgotPasswordSetNewPasswordRequestModel.fromRawJson(String str) =>
      ForgotPasswordSetNewPasswordRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordSetNewPasswordRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ForgotPasswordSetNewPasswordRequestModel(
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
