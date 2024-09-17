import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/comment_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/like_dislike_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/share_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/upvote_downvote_button.dart';

class RowButtonContainer extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final ReactionType reactionType;
  final Feed? data;

  const RowButtonContainer(
      {super.key,
      required this.data,
      required this.color,
      required this.backgroundColor,
      this.reactionType = ReactionType.NONE});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LikeDislikeButton(
            data: data,
            color: color,
            backgroundColor: backgroundColor,
            reactionType: reactionType),
        commentButton("${data!.commentsCount}", color),
        shareButton("${data!.sharesCount}", color),
        UpvoteDownvoteWidget(
          data: data,
          color: color,
          backgroundColor: backgroundColor,
        )
      ],
    );
  }
}
