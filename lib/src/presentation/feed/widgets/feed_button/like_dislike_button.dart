import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_show_menu.dart';

Row likeDislikeButton(
    BuildContext context, String likeCount, Color color, Color backgroundColor,
    {ReactionType reactionType = ReactionType.NONE}) {
  return Row(
    children: [
      Theme(
        data: Theme.of(context).copyWith(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory),
        child: GestureDetector(
          onTap: () {},
          onLongPressStart: (details) async {
            final offset = details.globalPosition;
            reactionShowMenu(context, offset);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadiusDirectional.horizontal(
                    start: Radius.circular(80))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                reactionButton(color, reactionType),
                Text(
                  likeCount,
                  style: regularProximaNovaTextStyle.copyWith(
                      fontSize: 16, color: color),
                )
              ],
            ),
          ),
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
        child: reactionType == ReactionType.BAD
            ? SvgPicture.asset(
                thumbDownFilled,
              )
            : SvgPicture.asset(
                thumbDownOutline,
                color: color,
              ),
      )
    ],
  );
}
