import 'dart:convert';

import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/core/utils/reaction_utils.dart';
import 'package:nowdots_social_news/src/core/utils/vote_utils.dart';
import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';
import 'package:nowdots_social_news/src/data/models/reaction_model.dart';

class FeedsResponseModel {
  final int? currentPage;
  final List<Feed>? data;
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

  FeedsResponseModel({
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

  factory FeedsResponseModel.fromRawJson(String str) =>
      FeedsResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeedsResponseModel.fromJson(Map<String, dynamic> json) =>
      FeedsResponseModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Feed>.from(json["data"]!.map((x) => Feed.fromJson(x))),
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

class Feed {
  final int? id;
  final int? userId;
  final int? categoryId;
  final String? content;
  final int? isPinned;
  final int? isAd;
  final int? isAnonymous;
  final dynamic shareId;
  final String? createdAt;
  final DateTime? updatedAt;
  int? likesCount;
  final int? dislikesCount;
  final int? commentsCount;
  final int? sharesCount;
  final int? bookmarksCount;
  final int? viewsCount;
  final int? photosCount;
  int? upVoteCount;
  final int? downVoteCount;
  final PurpleShare? share;
  final List<ReactionModel>? likes;
  final List<dynamic>? dislikes;
  final List<dynamic>? comments;
  final List<dynamic>? shares;
  final List<dynamic>? bookmarks;
  final List<dynamic>? upVote;
  final List<dynamic>? downVote;
  VoteType? voteType;
  ReactionType? reactionType;
  final UserModel? user;
  final List<dynamic>? photos;

  Feed({
    this.id,
    this.userId,
    this.categoryId,
    this.content,
    this.isPinned,
    this.isAd,
    this.isAnonymous,
    this.shareId,
    this.createdAt,
    this.updatedAt,
    this.likesCount,
    this.dislikesCount,
    this.commentsCount,
    this.sharesCount,
    this.bookmarksCount,
    this.viewsCount,
    this.photosCount,
    this.upVoteCount,
    this.downVoteCount,
    this.voteType,
    this.reactionType,
    this.share,
    this.likes,
    this.dislikes,
    this.comments,
    this.shares,
    this.bookmarks,
    this.upVote,
    this.downVote,
    this.user,
    this.photos,
  });

  factory Feed.fromRawJson(String str) => Feed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        content: json["content"],
        isPinned: json["is_pinned"],
        isAd: json["is_ad"],
        isAnonymous: json["is_anonymous"],
        shareId: json["share_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        likesCount: json["likes_count"],
        dislikesCount: json["dislikes_count"],
        commentsCount: json["comments_count"],
        sharesCount: json["shares_count"],
        bookmarksCount: json["bookmarks_count"],
        viewsCount: json["views_count"],
        photosCount: json["photos_count"],
        upVoteCount: json["up_vote_count"],
        downVoteCount: json["down_vote_count"],
        share:
            json["share"] == null ? null : PurpleShare.fromJson(json["share"]),
        likes: json["likes"] == null
            ? []
            : List<ReactionModel>.from(
                json["likes"]!.map((x) => ReactionModel.fromJson(x))),
        dislikes: json["dislikes"] == null
            ? []
            : List<dynamic>.from(json["dislikes"]!.map((x) => x)),
        comments: json["comments"] == null
            ? []
            : List<dynamic>.from(json["comments"]!.map((x) => x)),
        shares: json["shares"] == null
            ? []
            : List<dynamic>.from(json["shares"]!.map((x) => x)),
        bookmarks: json["bookmarks"] == null
            ? []
            : List<dynamic>.from(json["bookmarks"]!.map((x) => x)),
        upVote: json["up_vote"] == null
            ? []
            : List<dynamic>.from(json["up_vote"]!.map((x) => x)),
        downVote: json["down_vote"] == null
            ? []
            : List<dynamic>.from(json["down_vote"]!.map((x) => x)),
        voteType: getVoteTypeFromListData(
            json["up_vote"] != null
                ? List<dynamic>.from(json["up_vote"]!.map((x) => x))
                : [],
            json["down_vote"] != null
                ? List<dynamic>.from(json["down_vote"]!.map((x) => x))
                : []),
        reactionType: getReactionTypeFromListData(
            json["likes"] != null
                ? List<ReactionModel>.from(
                    json["likes"]!.map((x) => ReactionModel.fromJson(x)))
                : [],
            json["dislikes"] != null
                ? List<dynamic>.from(json["dislikes"]!.map((x) => x))
                : []),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        photos: json["photos"] == null
            ? []
            : List<dynamic>.from(json["photos"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "content": content,
        "is_pinned": isPinned,
        "is_ad": isAd,
        "is_anonymous": isAnonymous,
        "share_id": shareId,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "likes_count": likesCount,
        "dislikes_count": dislikesCount,
        "comments_count": commentsCount,
        "shares_count": sharesCount,
        "bookmarks_count": bookmarksCount,
        "views_count": viewsCount,
        "photos_count": photosCount,
        "up_vote_count": upVoteCount,
        "down_vote_count": downVoteCount,
        "share": share?.toJson(),
        "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "dislikes":
            dislikes == null ? [] : List<dynamic>.from(dislikes!.map((x) => x)),
        "comments":
            comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "shares":
            shares == null ? [] : List<dynamic>.from(shares!.map((x) => x)),
        "bookmarks": bookmarks == null
            ? []
            : List<dynamic>.from(bookmarks!.map((x) => x)),
        "up_vote":
            upVote == null ? [] : List<dynamic>.from(upVote!.map((x) => x)),
        "down_vote":
            downVote == null ? [] : List<dynamic>.from(downVote!.map((x) => x)),
        "user": user?.toJson(),
        "photos":
            photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
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

class PurpleShare {
  final int? id;
  final int? userId;
  final int? categoryId;
  final String? content;
  final int? isPinned;
  final int? isAd;
  final int? isAnonymous;
  final dynamic shareId;
  final String? createdAt;
  final DateTime? updatedAt;
  final UserModel? user;
  final List<dynamic>? photos;

  PurpleShare({
    this.id,
    this.userId,
    this.categoryId,
    this.content,
    this.isPinned,
    this.isAd,
    this.isAnonymous,
    this.shareId,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.photos,
  });

  factory PurpleShare.fromRawJson(String str) =>
      PurpleShare.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleShare.fromJson(Map<String, dynamic> json) => PurpleShare(
        id: json["id"],
        userId: json["user_id"],
        categoryId: json["category_id"],
        content: json["content"],
        isPinned: json["is_pinned"],
        isAd: json["is_ad"],
        isAnonymous: json["is_anonymous"],
        shareId: json["share_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        photos: json["photos"] == null
            ? []
            : List<dynamic>.from(json["photos"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category_id": categoryId,
        "content": content,
        "is_pinned": isPinned,
        "is_ad": isAd,
        "is_anonymous": isAnonymous,
        "share_id": shareId,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "photos":
            photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
      };
}
