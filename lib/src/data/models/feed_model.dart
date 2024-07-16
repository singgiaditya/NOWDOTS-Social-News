import 'package:nowdots_social_news/src/data/models/user_model.dart';

class FeedModel {
  final UserModel user;
  final String content;
  final String likeCount;
  final String commentCount;
  final String forwardCount;
  final String upVoteCount;
  final String published_at;
  final String type;

  FeedModel(
      {required this.user,
      required this.content,
      required this.likeCount,
      required this.commentCount,
      required this.forwardCount,
      required this.upVoteCount,
      required this.published_at,
      required this.type});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      user: UserModel.fromJson(json['user']),
      content: json['content'] ?? "",
      likeCount: json['likeCount'] ?? "",
      commentCount: json['commentCount'] ?? "",
      forwardCount: json['forwardCount'] ?? "",
      upVoteCount: json['upVoteCount'] ?? "",
      published_at: json['published_at'] ?? "",
      type: json['type'] ?? "",
    );
  }
}
