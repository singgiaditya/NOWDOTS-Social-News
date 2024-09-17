import 'dart:convert';

class ForgotPasswordSetNewPasswordResponseModel {
    final String? status;
    final String? message;

    ForgotPasswordSetNewPasswordResponseModel({
        this.status,
        this.message,
    });

    factory ForgotPasswordSetNewPasswordResponseModel.fromRawJson(String str) => ForgotPasswordSetNewPasswordResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForgotPasswordSetNewPasswordResponseModel.fromJson(Map<String, dynamic> json) => ForgotPasswordSetNewPasswordResponseModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
