import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';

VoteType getVoteTypeFromListData(
    List<dynamic>? upVoteData, List<dynamic>? downVoteData) {
  if (upVoteData!.isNotEmpty) {
    return VoteType.UP;
  }
  if (downVoteData!.isNotEmpty) {
    return VoteType.DOWN;
  }
  return VoteType.NONE;
}
