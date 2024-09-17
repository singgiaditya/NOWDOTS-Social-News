import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class ScoreWidget extends StatelessWidget {
  final String scoreString;
  const ScoreWidget({super.key, required this.scoreString});

  @override
  Widget build(BuildContext context) {
    final score = int.tryParse(scoreString);
    Color color = repScoreColor(score);
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
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color, width: 1)),
      child: Text(scoreString,
          style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15, color: color, fontWeight: FontWeight.w600)),
    );
  }
}

Color repScoreColor(int? score) {
  if (score != null) {
    if (score <= 0) {
      return score2Color;
    }
    if (score > 0) {
      return score3Color;
    }
    if (score > 100) {
      return score4Color;
    }
    if (score > 200) {
      return score5Color;
    }
    if (score > 500) {
      return score6Color;
    }
    if (score > 900) {
      return score7Color;
    }
  }
  return primaryColor;
}
