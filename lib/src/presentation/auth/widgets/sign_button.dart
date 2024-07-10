import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class IconSignButton extends StatelessWidget {
  final String svg;
  final String label;
  const IconSignButton({
    super.key,
    required this.svg,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: boxColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svg),
          const SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: subtitleProximaNovaTextStyle.copyWith(
                fontSize: 15, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
