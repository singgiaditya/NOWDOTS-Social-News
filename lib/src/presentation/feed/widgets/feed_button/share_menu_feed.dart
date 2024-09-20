import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';

void showShareMenuFeed(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          ListTile(
            leading: SvgPicture.asset(share),
            title: Text(
              "Share Now",
              style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.edit, color: primaryColor),
            title: Text(
              "Quote Share",
              style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: double.infinity,
              height: 40,
              margin:
                  EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: boxColor, width: 2)),
              child: Center(
                child: Text(
                  "Cancel",
                  style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
