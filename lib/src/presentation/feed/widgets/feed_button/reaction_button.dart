import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';

Widget reactionButton(Color color, ReactionType reactionType) {
  switch (reactionType) {
    case ReactionType.GOOD:
      return SvgPicture.asset(
        thumbUpFilled,
      );
    case ReactionType.NONE:
      return SvgPicture.asset(
        thumbUpOutline,
        color: color,
      );
    case ReactionType.KIND:
      return const Text("😇 ");
    case ReactionType.SMART:
      return const Text("😎 ");
    case ReactionType.WISE:
      return const Text("🥰 ");
    case ReactionType.HELPFUL:
      return const Text("❤️ ");
    default:
      return SvgPicture.asset(
        thumbUpOutline,
        color: color,
      );
  }
}
