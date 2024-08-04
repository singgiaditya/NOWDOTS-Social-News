import 'dart:convert';

class CreateAccountResponseModel {
    final String? status;
    final Data? data;
    final String? token;
    final String? message;

    CreateAccountResponseModel({
        this.status,
        this.data,
        this.token,
        this.message,
    });

    factory CreateAccountResponseModel.fromRawJson(String str) => CreateAccountResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateAccountResponseModel.fromJson(Map<String, dynamic> json) => CreateAccountResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "token": token,
        "message": message,
    };
}

class Data {
    final String? name;
    final String? email;
    final DateTime? dob;
    final int? codeVerification;
    final DateTime? updatedAt;
    final DateTime? createdAt;
    final int? id;

    Data({
        this.name,
        this.email,
        this.dob,
        this.codeVerification,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        codeVerification: json["code_verification"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "dob": dob?.toIso8601String(),
        "code_verification": codeVerification,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
