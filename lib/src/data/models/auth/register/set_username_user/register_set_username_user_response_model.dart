import 'dart:convert';

class RegisterSetUsernameUserResponseModel {
  final String? status;
  final Data? data;
  final String? message;

  RegisterSetUsernameUserResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory RegisterSetUsernameUserResponseModel.fromRawJson(String str) =>
      RegisterSetUsernameUserResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterSetUsernameUserResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RegisterSetUsernameUserResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final DateTime? dob;
  final dynamic codeVerification;
  final DateTime? emailVerifiedAt;
  final String? profilePhoto;
  final int? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.username,
    this.dob,
    this.codeVerification,
    this.emailVerifiedAt,
    this.profilePhoto,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        codeVerification: json["code_verification"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        profilePhoto: json["profile_photo"],
        isVerified: json["is_verified"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "dob": dob?.toIso8601String(),
        "code_verification": codeVerification,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "profile_photo": profilePhoto,
        "is_verified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
