import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';

WidgetSpan spanDivider() {
  return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      baseline: TextBaseline.alphabetic,
      child: CircleAvatar(
        backgroundColor: subColor,
        radius: 1,
      ));
}
