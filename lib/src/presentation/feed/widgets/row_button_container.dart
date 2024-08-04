import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';

class RowButtonContainer extends StatelessWidget {
  final String likeCount;
  final String commentCount;
  final String forwardCount;
  final String upVoteCount;
  final Color color;
  final Color backgroundColor;

  const RowButtonContainer(
      {super.key,
      required this.likeCount,
      required this.commentCount,
      required this.forwardCount,
      required this.upVoteCount,
      required this.color,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        likeDislikeButton(likeCount, color, backgroundColor),
        commentButton(commentCount, color),
        forwardButton(forwardCount, color),
        upvoteDownvoteButton(upVoteCount, color, backgroundColor)
      ],
    );
  }
}

Container upvoteDownvoteButton(
    String upVoteCount, Color color, Color backgroundColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(80)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          upVoteOutline,
          color: color,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          upVoteCount,
          style:
              regularProximaNovaTextStyle.copyWith(fontSize: 16, color: color),
        ),
        const SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          downVoteOutline,
          color: color,
        ),
      ],
    ),
  );
}

Row forwardButton(String forwardCount, Color color) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        forward,
        color: color,
      ),
      const SizedBox(
        width: 1,
      ),
      Text(
        forwardCount,
        style: regularProximaNovaTextStyle.copyWith(fontSize: 16, color: color),
      )
    ],
  );
}

Row commentButton(String commentCount, Color color) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        commentOutline,
        color: color,
      ),
      const SizedBox(
        width: 1,
      ),
      Text(
        commentCount,
        style: regularProximaNovaTextStyle.copyWith(fontSize: 16, color: color),
      )
    ],
  );
}

Row likeDislikeButton(String likeCount, Color color, Color backgroundColor) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadiusDirectional.horizontal(
                start: Radius.circular(80))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              thumbUpOutline,
              color: color,
            ),
            Text(
              likeCount,
              style: regularProximaNovaTextStyle.copyWith(
                  fontSize: 16, color: color),
            )
          ],
        ),
      ),
      const SizedBox(
        width: 1.5,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadiusDirectional.horizontal(
                end: Radius.circular(80))),
        child: SvgPicture.asset(
          thumbDownOutline,
          color: color,
        ),
      )
    ],
  );
}
