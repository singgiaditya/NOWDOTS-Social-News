import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class ScoreWidget extends StatelessWidget {
  final String scoreString;
  const ScoreWidget({super.key, required this.scoreString});

  @override
  Widget build(BuildContext context) {
    Color color = primaryColor;
    final score = int.tryParse(scoreString);
    if (score != null) {
      if (score <= 0) {
        color = score2Color;
      }
      if (score > 0) {
        color = score3Color;
      }
      if (score > 100) {
        color = score4Color;
      }
      if (score > 200) {
        color = score5Color;
      }
      if (score > 500) {
        color = score6Color;
      }
      if (score > 900) {
        color = score7Color;
      }
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 2)),
      child: Text(scoreString,
          style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15, color: color, fontWeight: FontWeight.w600)),
    );
  }
}
