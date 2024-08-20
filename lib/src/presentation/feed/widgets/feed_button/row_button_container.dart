import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/comment_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/like_dislike_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/share_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/upvote_downvote_button.dart';

class RowButtonContainer extends StatelessWidget {
  final String likeCount;
  final String commentCount;
  final String shareCount;
  final String upVoteCount;
  final Color color;
  final Color backgroundColor;
  final ReactionType reactionType;

  const RowButtonContainer(
      {super.key,
      required this.likeCount,
      required this.commentCount,
      required this.shareCount,
      required this.upVoteCount,
      required this.color,
      required this.backgroundColor,
      this.reactionType = ReactionType.NONE});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        likeDislikeButton(context, likeCount, color, backgroundColor,
            reactionType: reactionType),
        commentButton(commentCount, color),
        shareButton(shareCount, color),
        upvoteDownvoteButton(upVoteCount, color, backgroundColor)
      ],
    );
  }
}
