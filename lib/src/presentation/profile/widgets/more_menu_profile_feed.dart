import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

void showMoreMenuProfileFeed(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          ListTile(
              leading: Icon(
                Icons.ios_share_outlined,
                color: subColor,
              ),
              title: Text(
                "Share post",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(
                Icons.link,
                color: subColor,
              ),
              title: Text(
                "Copy post link",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(
                Icons.delete_outline,
                color: subColor,
              ),
              title: Text(
                "Delete post",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        textAlign: TextAlign.center,
                        'Delete Post?',
                        style: titleSegoeUITextStyle.copyWith(fontSize: 15),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'This can’t be undone and it will be removed from your profile, feed, news page, and from search results.',
                            style: regularSegoeUITextStyle.copyWith(
                                fontSize: 14, color: subColor),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Divider(
                            color: boxColor,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Delete',
                              style: titleSegoeUITextStyle.copyWith(
                                  fontSize: 15, color: score2Color),
                            ),
                          ),
                          Divider(
                            color: boxColor,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: regularSegoeUITextStyle.copyWith(
                                  fontSize: 15, color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                Navigator.pop(context);
              }),
        ],
      );
    },
  );
}
