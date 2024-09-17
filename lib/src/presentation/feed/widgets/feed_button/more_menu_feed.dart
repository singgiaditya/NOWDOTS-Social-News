import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';

void showMoreMenuFeed(BuildContext context, String username) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          ListTile(
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: subColor,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: Text(
                "Not interested",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                Navigator.pop(context);
              }),
          ListTile(
              leading: SvgPicture.asset(
                followIcon,
                color: subColor,
              ),
              title: Text(
                "Follow @$username",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: buttonColor,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 2,
                        left: 28,
                        right: 28),
                    content: Text(
                      "You Followed @$username",
                      style: subtitleProximaNovaTextStyle.copyWith(
                          fontSize: 15, color: Colors.white),
                    )));
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(
                Icons.volume_off,
                color: subColor,
              ),
              title: Text(
                "Mute @$username",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: buttonColor,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 2,
                      left: 28,
                      right: 28),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "@$username has been muted",
                        style: subtitleProximaNovaTextStyle.copyWith(
                            fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Undo",
                        style: titleProximaNovaTextStyle.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ));
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(
                Icons.bookmark_outline_rounded,
                color: subColor,
              ),
              title: Text(
                "Follow post",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: buttonColor,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 2,
                      left: 28,
                      right: 28),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "This post has been followed",
                        style: subtitleProximaNovaTextStyle.copyWith(
                            fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Undo",
                        style: titleProximaNovaTextStyle.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ));
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(
                Icons.block,
                color: subColor,
              ),
              title: Text(
                "Block @$username",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "Block @$username?",
                                style: titleSegoeUITextStyle.copyWith(
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "They will not be able to follow you or view your posts, and you will not see posts or notifications from @$username",
                                style: regularSegoeUITextStyle.copyWith(
                                    color: subColor, fontSize: 14),
                              ),
                              SizedBox(
                                height: 34,
                              ),
                              SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            score2Color)),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: buttonColor,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            left: 28,
                                            right: 28),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Successfully blocked",
                                              style:
                                                  subtitleProximaNovaTextStyle
                                                      .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                            ),
                                            Text(
                                              "Undo",
                                              style: titleProximaNovaTextStyle
                                                  .copyWith(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Block",
                                      style: titleProximaNovaTextStyle.copyWith(
                                          fontSize: 15, color: boxColor),
                                    )),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: boxColor),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Center(
                                    child: Text("Cancel",
                                        style:
                                            titleProximaNovaTextStyle.copyWith(
                                          fontSize: 15,
                                          color: primaryColor,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 34,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
          ListTile(
              leading: Icon(
                Icons.flag_outlined,
                color: subColor,
              ),
              title: Text(
                "Report post",
                style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () async {
                Navigator.pop(context);
                context.pushNamed("report", extra: username);
              }),
        ],
      );
    },
  );
}
