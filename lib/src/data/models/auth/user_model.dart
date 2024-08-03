import 'dart:convert';

class UserModel {
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

  UserModel({
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

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
