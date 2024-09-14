import 'dart:convert';

class ProfileModel {
  final int? id;
  final int? userId;
  final String? bio;
  final String? location;
  final dynamic languages;
  final String? instagram;
  final String? twitter;
  final String? tiktok;
  final String? spotify;
  final String? website;
  final dynamic coverProfile;
  final int? repScore;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileModel({
    this.id,
    this.userId,
    this.bio,
    this.location,
    this.languages,
    this.instagram,
    this.twitter,
    this.tiktok,
    this.spotify,
    this.website,
    this.coverProfile,
    this.repScore,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        userId: json["user_id"],
        bio: json["bio"],
        location: json["location"],
        languages: json["languages"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        tiktok: json["tiktok"],
        spotify: json["spotify"],
        website: json["website"],
        coverProfile: json["cover_profile"],
        repScore: json["rep_score"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bio": bio,
        "location": location,
        "languages": languages,
        "instagram": instagram,
        "twitter": twitter,
        "tiktok": tiktok,
        "spotify": spotify,
        "website": website,
        "cover_profile": coverProfile,
        "rep_score": repScore,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
