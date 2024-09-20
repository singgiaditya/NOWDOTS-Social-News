import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/comment_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/like_dislike_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/upvote_downvote_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';

class CommentCard extends StatelessWidget {
  final Function commentOnTap;
  final bool? childLine;
  final bool? downline;
  const CommentCard(
      {super.key,
      required this.commentOnTap,
      this.childLine = false,
      this.downline = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const AvatarCacheImage(
                image: "https://picsum.photos/200/300",
                radius: 20,
              ),
              downline!
                  ? Flexible(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          color: boxColor,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          const SizedBox(
            width: 11,
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "John Doe",
                      style: titleProximaNovaTextStyle.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const SizedBox(
                        height: 22, child: ScoreWidget(scoreString: "100")),
                    Text(
                      " | ",
                      style: regularProximaNovaTextStyle.copyWith(
                          color: subColor, fontSize: 15),
                    ),
                    Flexible(
                      child: Text(
                        "@Johndoeeeee",
                        style: regularProximaNovaTextStyle.copyWith(
                            color: subColor,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const Text(" "),
                    CircleAvatar(
                      backgroundColor: subColor,
                      radius: 1,
                    ),
                    Text(
                      " 2 jam",
                      style: regularProximaNovaTextStyle.copyWith(
                          color: subColor, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                HashtagText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea #commodo #consequat.",
                  regularTextStyle: regularProximaNovaTextStyle.copyWith(
                      fontSize: 15, color: primaryColor),
                  decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                      fontSize: 15, color: buttonColor),
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LikeDislikeButton(
                      color: primaryColor,
                      backgroundColor: boxColor,
                      data: Feed(),
                    ),
                    GestureDetector(
                        onTap: () {
                          commentOnTap();
                        },
                        child: commentButton("7", primaryColor)),
                    upvoteDownvoteButton(
                        "123", primaryColor, boxColor, VoteType.NONE)
                  ],
                )
              ],
            ),
          ),
          Icon(
            Icons.more_horiz,
            color: subColor,
            size: 20,
          )
        ],
      ),
    );
  }
}

class CommentChildCard extends StatelessWidget {
  final Function commentOnTap;
  final bool? childLine;
  final bool? downline;
  const CommentChildCard(
      {super.key,
      required this.commentOnTap,
      this.childLine = false,
      this.downline = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: childLine! ? 19 : 70,
          ), //19
          color: boxColor,
          width: 2,
          height: 20,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 19),
                height: 20,
                width: 2,
                color: childLine! ? boxColor : Colors.transparent,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        color: childLine! ? boxColor : Colors.transparent,
                        width: 30,
                        height: 2,
                      ),
                      const AvatarCacheImage(
                        image: "https://picsum.photos/200/300",
                        radius: 20,
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      color: downline! ? boxColor : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 11,
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "John Doe",
                          style:
                              titleProximaNovaTextStyle.copyWith(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const SizedBox(
                            height: 22, child: ScoreWidget(scoreString: "100")),
                        Text(
                          " | ",
                          style: regularProximaNovaTextStyle.copyWith(
                              color: subColor, fontSize: 15),
                        ),
                        Flexible(
                          child: Text(
                            "@Johndoeeeee",
                            style: regularProximaNovaTextStyle.copyWith(
                                color: subColor,
                                fontSize: 15,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        const Text(" "),
                        CircleAvatar(
                          backgroundColor: subColor,
                          radius: 1,
                        ),
                        Text(
                          " 2 jam",
                          style: regularProximaNovaTextStyle.copyWith(
                              color: subColor, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    HashtagText(
                      text:
                          "@JohnDoe Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor?",
                      regularTextStyle: regularProximaNovaTextStyle.copyWith(
                          fontSize: 15, color: primaryColor),
                      decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                          fontSize: 15, color: buttonColor),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LikeDislikeButton(
                          color: primaryColor,
                          backgroundColor: boxColor,
                          data: Feed(),
                        ),
                        GestureDetector(
                            onTap: () {
                              commentOnTap();
                            },
                            child: commentButton("Reply", primaryColor)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentCardExpandedWidget extends StatefulWidget {
  const CommentCardExpandedWidget({super.key});

  @override
  _CommentCardExpandedWidgetState createState() =>
      _CommentCardExpandedWidgetState();
}

class _CommentCardExpandedWidgetState extends State<CommentCardExpandedWidget> {
  bool _expanded = false;

  void commentOnTap() {
    _expanded = !_expanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentCard(
          downline: _expanded,
          commentOnTap: () {
            commentOnTap();
          },
        ),
        Visibility(
          visible: _expanded,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return CommentChildCard(
                  commentOnTap: () {},
                  childLine: _expanded,
                  downline: index < 3 - 1,
                );
              }
              return CommentChildCard(
                commentOnTap: () {},
                downline: index < 3 - 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
