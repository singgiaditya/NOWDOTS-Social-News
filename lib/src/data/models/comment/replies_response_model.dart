import 'dart:convert';

class RepliesResponseModel {
  final int? currentPage;
  final List<Replies>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  RepliesResponseModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory RepliesResponseModel.fromRawJson(String str) =>
      RepliesResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepliesResponseModel.fromJson(Map<String, dynamic> json) =>
      RepliesResponseModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Replies>.from(json["data"]!.map((x) => Replies.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Replies {
  final int? id;
  final int? userId;
  final int? feedId;
  final int? parentId;
  final String? content;
  final String? createdAt;
  final DateTime? updatedAt;
  final int? likesCount;
  final int? dislikesCount;
  final User? user;
  final List<dynamic>? likes;
  final List<dynamic>? dislikes;

  Replies({
    this.id,
    this.userId,
    this.feedId,
    this.parentId,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.likesCount,
    this.dislikesCount,
    this.user,
    this.likes,
    this.dislikes,
  });

  factory Replies.fromRawJson(String str) => Replies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Replies.fromJson(Map<String, dynamic> json) => Replies(
        id: json["id"],
        userId: json["user_id"],
        feedId: json["feed_id"],
        parentId: json["parent_id"],
        content: json["content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        likesCount: json["likes_count"],
        dislikesCount: json["dislikes_count"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        likes: json["likes"] == null
            ? []
            : List<dynamic>.from(json["likes"]!.map((x) => x)),
        dislikes: json["dislikes"] == null
            ? []
            : List<dynamic>.from(json["dislikes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "feed_id": feedId,
        "parent_id": parentId,
        "content": content,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "likes_count": likesCount,
        "dislikes_count": dislikesCount,
        "user": user?.toJson(),
        "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "dislikes":
            dislikes == null ? [] : List<dynamic>.from(dislikes!.map((x) => x)),
      };
}

class User {
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

  User({
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

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
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

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
