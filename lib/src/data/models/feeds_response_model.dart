import 'dart:convert';

class FeedsResponseModel {
  final List<Feed>? data;

  FeedsResponseModel({
    this.data,
  });

  factory FeedsResponseModel.fromRawJson(String str) =>
      FeedsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedsResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedsResponseModel(
        data: json["data"] == null
            ? []
            : List<Feed>.from(json["data"]!.map((x) => Feed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Feed {
  final User? user;
  final String? content;
  final String? likeCount;
  final String? commentCount;
  final String? forwardCount;
  final String? upVoteCount;
  final String? publishedAt;
  final Type? type;
  final bool? isAds;
  final String? image;

  Feed({
    this.user,
    this.content,
    this.likeCount,
    this.commentCount,
    this.forwardCount,
    this.upVoteCount,
    this.publishedAt,
    this.type,
    this.isAds,
    this.image,
  });

  factory Feed.fromRawJson(String str) => Feed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        content: json["content"],
        likeCount: json["likeCount"],
        commentCount: json["commentCount"],
        forwardCount: json["forwardCount"],
        upVoteCount: json["upVoteCount"],
        publishedAt: json["published_at"],
        type: typeValues.map[json["type"]],
        isAds: json["isAds"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "content": content,
        "likeCount": likeCount,
        "commentCount": commentCount,
        "forwardCount": forwardCount,
        "upVoteCount": upVoteCount,
        "published_at": publishedAt,
        "type": typeValues.reverse[type],
        "isAds": isAds,
        "image": image,
      };
}

enum Type { PUBLIC }

final typeValues = EnumValues({"Public": Type.PUBLIC});

class User {
  final String? name;
  final String? username;
  final String? score;
  final String? picture;
  final bool? isVerified;

  User({
    this.name,
    this.username,
    this.score,
    this.picture,
    this.isVerified,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        username: json["username"],
        score: json["score"],
        picture: json["picture"],
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "score": score,
        "picture": picture,
        "isVerified": isVerified,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
