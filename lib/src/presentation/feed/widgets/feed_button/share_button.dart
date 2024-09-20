import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';


Widget shareButton(String forwardCount, Color color, GestureTapCallback shareOnTap) {
  return GestureDetector(
    onTap: shareOnTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          share,
          color: color,
        ),
        const SizedBox(
          width: 1,
        ),
        Text(
          forwardCount,
          style:
              regularProximaNovaTextStyle.copyWith(fontSize: 16, color: color),
        )
      ],
    ),
  );
}
