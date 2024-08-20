import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';

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