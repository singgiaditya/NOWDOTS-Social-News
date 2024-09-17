import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class ReportContinue extends StatelessWidget {
  const ReportContinue({super.key});

  @override
  Widget build(BuildContext context) {
    final String username = GoRouterState.of(context).extra as String;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Thanks for helping improve Nowdots for everyone.",
                  style: subtitleProximaNovaTextStyle.copyWith(
                    fontSize: 26,
                  ),
                ),
                Text(
                  "We understand it wasn’t easy, so we’re grateful for your time in answering these questions.",
                  style: regularSegoeUITextStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 34,
                ),
                Text(
                  "Current Status",
                  style: subtitleSegoeUITextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  "We've received your report and have temporarily hidden the post from your timeline.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: thirdColor),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Next Steps",
                  style: subtitleSegoeUITextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  "An automated process will now review the post for spam. This automation helps us handle the vast number of reports we receive each year. Additionally, this information will be used to enhance our platform and reduce similar content in the future.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: thirdColor),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Other Actions You Can Take",
                  style: subtitleSegoeUITextStyle.copyWith(fontSize: 15),
                ),
                Text(
                  "Remove @${username} posts from your timeline without needing to unfollow or block them.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: thirdColor),
                ),
                SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
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
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: boxColor),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                        child: Text(
                      "Mute @${username}",
                      style:
                          subtitleProximaNovaTextStyle.copyWith(fontSize: 15),
                    )),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Block @$username to prevent them from following you, seeing your posts, or messaging you. Blocking will also stop you from seeing any posts or notifications from them.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: thirdColor),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
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
                                  "Successfully blocked",
                                  style: subtitleProximaNovaTextStyle.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ));
                          context.pop();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(score2Color)),
                        child: Text(
                          "Block @${username}",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ))),
                SizedBox(
                  height: 23,
                ),
                SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
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
                                  "Successfully reported",
                                  style: subtitleProximaNovaTextStyle.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ));
                          context.pop();
                        },
                        child: Text(
                          "Done",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ))),
                SizedBox(
                  height: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
