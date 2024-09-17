import 'dart:convert';

import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';

class ReactionModel {
  final ReactionType? tag;

  ReactionModel({
    this.tag,
  });

  factory ReactionModel.fromRawJson(String str) =>
      ReactionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReactionModel.fromJson(Map<String, dynamic> json) => ReactionModel(
        tag: stringToReactionType(json["tag"]),
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
      };
}

ReactionType stringToReactionType(String tag) {
  switch (tag) {
    case "good":
      return ReactionType.GOOD;
    case "kind":
      return ReactionType.KIND;
    // case "bad":
    //   return ReactionType.BAD;
    case "smart":
      return ReactionType.SMART;
    case "wise":
      return ReactionType.WISE;
    case "helpful":
      return ReactionType.HELPFUL;
    default:
      return ReactionType.NONE;
  }
}
