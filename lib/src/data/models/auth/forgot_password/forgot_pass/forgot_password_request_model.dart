import 'dart:convert';

class ForgotPasswordRequestModel {
    final String? emailOrUsername;

    ForgotPasswordRequestModel({
        this.emailOrUsername,
    });

    factory ForgotPasswordRequestModel.fromRawJson(String str) => ForgotPasswordRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) => ForgotPasswordRequestModel(
        emailOrUsername: json["emailOrUsername"],
    );

    Map<String, dynamic> toJson() => {
        "emailOrUsername": emailOrUsername,
    };
}
