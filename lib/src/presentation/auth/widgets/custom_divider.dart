import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: boxColor)),
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          "or",
          style: regularProximaNovaTextStyle.copyWith(fontSize: 15),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Container(
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: boxColor)),
        ),
      ],
    );
  }
}
