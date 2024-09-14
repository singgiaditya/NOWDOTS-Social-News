import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/data/models/reaction_model.dart';

ReactionType getReactionTypeFromListData(
    List<ReactionModel>? likesData, List<dynamic>? dislikesData) {
  if (likesData!.isNotEmpty) {
    return likesData.first.tag!;
  }
  if (dislikesData!.isNotEmpty) {
    return ReactionType.BAD;
  }
  return ReactionType.NONE;
}
