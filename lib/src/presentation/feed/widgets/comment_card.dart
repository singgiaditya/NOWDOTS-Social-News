import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/comment/comments_response_model.dart';
import 'package:nowdots_social_news/src/data/models/comment/replies_response_model.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/data/models/reaction_model.dart';
import 'package:nowdots_social_news/src/injection_container.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/comment_replies/comment_replies_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/comment_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/like_dislike_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/upvote_downvote_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:shimmer/shimmer.dart';

class CommentCard extends StatelessWidget {
  final Function commentOnTap;
  final bool? childLine;
  final bool? downline;
  final Comment? data;
  const CommentCard(
      {super.key,
      required this.commentOnTap,
      this.childLine = false,
      this.downline = false,
      this.data});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AvatarCacheImage(
                image: data != null
                    ? baseUrl + "${data?.user?.profilePhoto}"
                    : " ",
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
                      data != null ? "${data?.user?.name}" : "John Doe",
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
                        data != null ? "@${data?.user?.username}" : "@JohnDoe",
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
                      data != null ? " ${data?.createdAt}" : "1 j",
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: HashtagText(
                    text: data != null ? "${data!.content}" : " ",
                    regularTextStyle: regularProximaNovaTextStyle.copyWith(
                        fontSize: 15, color: primaryColor),
                    decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                        fontSize: 15, color: buttonColor),
                  ),
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
                      data: Feed(
                          likesCount: data != null ? data!.likesCount ?? 0 : 0),
                    ),
                    GestureDetector(
                        onTap: () {
                          commentOnTap();
                        },
                        child: commentButton(
                            data != null ? "${data!.repliesCount ?? 0}" : "0",
                            primaryColor)),
                    upvoteDownvoteButton(
                        data != null ? "${data!.upVoteCount ?? 0}" : "0",
                        primaryColor,
                        boxColor,
                        VoteType.NONE)
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
  final Replies? replies;
  const CommentChildCard(
      {super.key,
      required this.commentOnTap,
      this.childLine = false,
      this.downline = false,
      required this.replies});

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
                      AvatarCacheImage(
                        image: replies != null
                            ? baseUrl + "${replies!.user!.profilePhoto}"
                            : null,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  (MediaQuery.of(context).size.width - 20) / 4),
                          child: Text(
                            replies != null
                                ? "${replies?.user!.name ?? "John Doe"}"
                                : "John Doe",
                            style: titleProximaNovaTextStyle.copyWith(
                                fontSize: 15, overflow: TextOverflow.ellipsis),
                          ),
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
                            replies != null
                                ? "@${replies?.user!.username ?? "JohnDoe"}"
                                : "@johndoe",
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
                          " ${replies?.createdAt}",
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
                      text: replies != null ? "${replies?.content}" : " ",
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
                          data: Feed(
                              likes: [ReactionModel(tag: ReactionType.NONE)],
                              dislikes: [],
                              likesCount: replies != null
                                  ? replies!.likesCount ?? 0
                                  : 0),
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
  final Comment? data;
  final String feedId;
  const CommentCardExpandedWidget(
      {super.key, required this.data, required this.feedId});

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
          data: widget.data,
          downline: _expanded,
          commentOnTap: () {
            commentOnTap();
          },
        ),
        Visibility(
          visible: _expanded,
          child: BlocProvider(
            create: (context) => CommentRepliesBloc(sl())
              ..add(CommentRepliesEvent.getRepliesComment(
                  widget.feedId, "${widget.data!.id}")),
            child: BlocBuilder<CommentRepliesBloc, CommentRepliesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Shimmer(
                      gradient: shimmerGradient,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return CommentChildCard(
                              commentOnTap: () {},
                              replies: null,
                              childLine: _expanded,
                              downline: index < 3 - 1,
                            );
                          }
                          return CommentChildCard(
                            replies: null,
                            commentOnTap: () {},
                            downline: index < 3 - 1,
                          );
                        },
                      ),
                    );
                  },
                  loaded: (replies) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: replies.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return CommentChildCard(
                            commentOnTap: () {},
                            replies: replies.data![index],
                            childLine: _expanded,
                            downline: index < 3 - 1,
                          );
                        }
                        return CommentChildCard(
                          commentOnTap: () {},
                          replies: replies.data![index],
                          downline: index < 3 - 1,
                        );
                      },
                    );
                  },
                  error: (message) => Center(child: Text("$message")),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
