import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/core/utils/reaction_utils.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/reaction/reaction_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/vote/vote_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/more_menu_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/share_menu_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/image_hero.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_show_menu.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/span_divider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailFeedCard extends StatefulWidget {
  final Feed data;

  const DetailFeedCard({super.key, required this.data});

  @override
  State<DetailFeedCard> createState() => _DetailFeedCardState();
}

class _DetailFeedCardState extends State<DetailFeedCard> {
  late ReactionType reactionType;

  @override
  void initState() {
    super.initState();
    reactionType =
        getReactionTypeFromListData(widget.data.likes, widget.data.dislikes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 21),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.data.isAnonymous! == 0
                  ? AvatarCacheImage(
                      image: widget.data.user!.profilePhoto != null
                          ? "$baseUrl${widget.data.user!.profilePhoto}"
                          : null,
                      radius: 25,
                    )
                  : CircleAvatar(
                      backgroundImage: AssetImage(anonymousAvatar),
                      radius: 25,
                    ),
              const SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.data.isAnonymous! == 0
                          ? Text(
                              widget.data.user!.name!,
                              style: titleProximaNovaTextStyle.copyWith(
                                  fontSize: 15),
                            )
                          : Text(
                              "Anonymous",
                              style: titleProximaNovaTextStyle.copyWith(
                                  fontSize: 15),
                            ),
                      widget.data.user!.isVerified! != 0 &&
                              widget.data.isAnonymous == 0
                          ? Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.verified,
                                color: buttonColor,
                                size: 15,
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        width: 4,
                      ),
                      widget.data.isAnonymous == 0
                          ? ScoreWidget(
                              scoreString: widget.data.user!.profile?.repScore
                                      .toString() ??
                                  "TBD",
                            )
                          : Container()
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                        text: widget.data.isAnonymous! == 0
                            ? "@${widget.data.user!.username!} "
                            : "@anonymous ",
                        style: regularProximaNovaTextStyle.copyWith(
                          color: subColor,
                        ),
                        children: isAds(widget.data.isAd! != 0)),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    showMoreMenuFeed(context, widget.data.user!.username!);
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: subColor,
                    size: 20,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  widget.data.voteType == VoteType.UP
                      ? GestureDetector(
                          onTap: () {
                            context.read<VoteBloc>().add(VoteEvent.unVote(
                                VoteType.UP, "${widget.data.id}"));
                            widget.data.upVoteCount =
                                widget.data.upVoteCount! - 1;
                            widget.data.voteType = VoteType.NONE;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            upVoteFilled,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.read<VoteBloc>().add(VoteEvent.vote(
                                VoteType.UP, "${widget.data.id}"));
                            widget.data.upVoteCount =
                                widget.data.upVoteCount! + 1;
                            widget.data.voteType = VoteType.UP;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            upVoteOutline,
                          ),
                        ),
                  Text("${widget.data.upVoteCount}"),
                  widget.data.voteType == VoteType.DOWN
                      ? GestureDetector(
                          onTap: () {
                            context.read<VoteBloc>().add(VoteEvent.unVote(
                                VoteType.DOWN, "${widget.data.id}"));
                            widget.data.voteType = VoteType.NONE;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            downVoteFilled,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.read<VoteBloc>().add(VoteEvent.vote(
                                VoteType.DOWN, "${widget.data.id}"));
                            if (widget.data.voteType == VoteType.UP) {
                              widget.data.upVoteCount =
                                  widget.data.upVoteCount! - 1;
                            }
                            widget.data.voteType = VoteType.DOWN;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            downVoteOutline,
                          ),
                        ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.data.content != null
                        ? HashtagText(
                            text: widget.data.content ?? "",
                            decoratedTextStyle: regularProximaNovaTextStyle
                                .copyWith(fontSize: 14, color: buttonColor),
                            regularTextStyle:
                                regularProximaNovaTextStyle.copyWith(
                                    fontSize: 14,
                                    color: primaryColor,
                                    height: 1.25),
                          )
                        : Container(),
                    widget.data.content != null
                        ? SizedBox(
                            height: 10,
                          )
                        : Container(),
                    widget.data.photos!.isNotEmpty
                        ? buildImages(context)
                        : Container(),
                    widget.data.shareId != null
                        ? _buildQuoteShare()
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: RichText(
              text: TextSpan(
                  text: "10:13 AM ",
                  style: regularSegoeUITextStyle.copyWith(
                      color: subColor, fontSize: 14),
                  children: [
                spanDivider(),
                const TextSpan(text: " Oct 26, 2023 "),
                spanDivider(),
                TextSpan(
                    text: " 6.2M ",
                    style: subtitleSegoeUITextStyle.copyWith(fontSize: 14)),
                const TextSpan(text: "Views")
              ])),
        ),
        const SizedBox(
          height: 22,
        ),
        Divider(
          color: boxColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CountText(count: "${widget.data.likesCount}", label: "Likes"),
              CountText(
                count: "${widget.data.commentsCount!}",
                label: "Comments",
              ),
              CountText(
                count: "${widget.data.sharesCount!}",
                label: "Shares",
              ),
              CountText(
                count: "${widget.data.upVoteCount}",
                label: "Votes",
              ),
            ],
          ),
        ),
        Divider(
          color: boxColor,
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory),
              child: GestureDetector(
                onTap: () {
                  if (widget.data.reactionType != ReactionType.NONE &&
                      widget.data.reactionType != ReactionType.BAD) {
                    context.read<ReactionBloc>().add(ReactionEvent.unReaction(
                        widget.data.reactionType!, "${widget.data.id}"));
                    setState(() {
                      widget.data.reactionType = ReactionType.NONE;
                      widget.data.likesCount = widget.data.likesCount! - 1;
                    });
                  } else {
                    context.read<ReactionBloc>().add(ReactionEvent.reaction(
                        ReactionType.GOOD, "${widget.data.id}"));
                    setState(() {
                      widget.data.reactionType = ReactionType.GOOD;
                      widget.data.likesCount = widget.data.likesCount! + 1;
                    });
                  }
                },
                onLongPressStart: (details) async {
                  final offset = details.globalPosition;
                  final result = await reactionShowMenu(context, offset);
                  if (result != null && result != widget.data.reactionType) {
                    BlocProvider.of<ReactionBloc>(context).add(
                        ReactionEvent.reaction(result, "${widget.data.id}"));
                    if (widget.data.reactionType == ReactionType.NONE ||
                        widget.data.reactionType == ReactionType.BAD) {
                      widget.data.likesCount = widget.data.likesCount! + 1;
                    }
                    widget.data.reactionType = result;
                    setState(() {});
                  }
                },
                child: reactionButton(primaryColor,
                    widget.data.reactionType ?? ReactionType.NONE),
              ),
            ),
            GestureDetector(
                onTap: () {
                  if (widget.data.reactionType == ReactionType.BAD) {
                    context.read<ReactionBloc>().add(ReactionEvent.unReaction(
                        ReactionType.BAD, "${widget.data.id}"));
                    widget.data.reactionType = ReactionType.NONE;
                  } else {
                    context.read<ReactionBloc>().add(ReactionEvent.reaction(
                        ReactionType.BAD, "${widget.data.id}"));
                    if (widget.data.reactionType != ReactionType.NONE &&
                        widget.data.reactionType != ReactionType.BAD) {
                      widget.data.likesCount = widget.data.likesCount! - 1;
                    }
                    widget.data.reactionType = ReactionType.BAD;
                  }
                  setState(() {});
                },
                child: SvgPicture.asset(
                    widget.data.reactionType == ReactionType.BAD
                        ? thumbDownFilled
                        : thumbDownOutline)),
            SvgPicture.asset(commentOutline),
            GestureDetector(
                onTap: () => showShareMenuFeed(context),
                child: SvgPicture.asset(share)),
            SvgPicture.asset(bookmarkOutline),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: boxColor,
          height: 0,
        )
      ]),
    );
  }

  Container _buildQuoteShare() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: boxColor),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.data.isAnonymous! == 0
                  ? AvatarCacheImage(
                      image: widget.data.share!.user!.profilePhoto != null
                          ? "$baseUrl${widget.data.share!.user!.profilePhoto}"
                          : null,
                      radius: 18,
                    )
                  : CircleAvatar(
                      backgroundImage: AssetImage(anonymousAvatar),
                      radius: 18,
                    ),
              const SizedBox(
                width: 9,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.data.isAnonymous! == 0
                      ? Container(
                          constraints: BoxConstraints(maxWidth: 80),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.data.share!.user!.name!,
                            style: titleProximaNovaTextStyle.copyWith(
                                fontSize: 15),
                          ),
                        )
                      : Text(
                          "Anonymous",
                          style:
                              titleProximaNovaTextStyle.copyWith(fontSize: 15),
                        ),
                  widget.data.user!.isVerified != 0 &&
                          widget.data.isAnonymous == 0
                      ? Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.verified,
                            color: buttonColor,
                            size: 15,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    width: 4,
                  ),
                  widget.data.isAnonymous == 0
                      ? SizedBox(
                          height: 20,
                          child: ScoreWidget(
                            scoreString: widget.data.user?.profile?.repScore
                                    .toString() ??
                                "TBD",
                          ),
                        )
                      : Container(),
                  Text(
                    " | ",
                    style: regularProximaNovaTextStyle.copyWith(
                        color: subColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Flexible(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 40),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "@${widget.data.share?.user?.username}",
                        style: regularProximaNovaTextStyle.copyWith(
                            color: subColor, fontSize: 16),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: " ",
                        style: regularProximaNovaTextStyle.copyWith(
                            color: subColor, fontSize: 14),
                        children: [
                          spanDivider(),
                          TextSpan(
                            text: " 2mgg",
                          )
                        ]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          HashtagText(
            text: widget.data.share?.content ?? " ",
            decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                fontSize: 14, color: buttonColor),
            regularTextStyle: regularProximaNovaTextStyle.copyWith(
                fontSize: 14, color: primaryColor, height: 1.25),
          ),
        ],
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    if (widget.data.photos!.length == 2) {
      return Row(
        children: [
          Flexible(
            child: ImageHero(
              data: widget.data,
              index: 0,
              width: null,
              height: 200,
              type: 2,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: ImageHero(
              data: widget.data,
              index: 1,
              width: null,
              height: 200,
              type: 3,
            ),
          )
        ],
      );
    }

    if (widget.data.photos!.length == 3) {
      return Row(
        children: [
          Flexible(
            child: ImageHero(
              data: widget.data,
              index: 0,
              width: null,
              height: 200,
              type: 2,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Column(
              children: [
                ImageHero(
                  data: widget.data,
                  index: 1,
                  width: null,
                  height: 97.5,
                  type: 4,
                ),
                const SizedBox(
                  height: 5,
                ),
                ImageHero(
                  data: widget.data,
                  index: 2,
                  width: null,
                  height: 97.5,
                  type: 5,
                ),
              ],
            ),
          )
        ],
      );
    }

    if (widget.data.photos!.length == 4) {
      return Column(
        children: [
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 0,
                  width: null,
                  height: 120,
                  type: 6,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 1,
                  width: null,
                  height: 120,
                  type: 4,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 2,
                  width: null,
                  height: 120,
                  type: 7,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 3,
                  width: null,
                  height: 120,
                  type: 5,
                ),
              )
            ],
          )
        ],
      );
    }

    if (widget.data.photos!.length > 4) {
      return Column(
        children: [
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 0,
                  width: null,
                  height: 120,
                  type: 6,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 1,
                  width: null,
                  height: 120,
                  type: 4,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: widget.data,
                  index: 2,
                  width: null,
                  height: 120,
                  type: 7,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                  child: GestureDetector(
                onTap: () {
                  context.pushNamed("image",
                      extra: widget.data, pathParameters: {"index": "3"});
                },
                child: CachedNetworkImage(
                  imageUrl: widget.data.photos![3],
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: null,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Center(
                            child: Text(
                          "+${widget.data.photos!.length - 3}",
                          style: titleProximaNovaTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 29,
                          ),
                        )),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => Shimmer(
                    gradient: shimmerGradient,
                    child: Container(
                      margin: const EdgeInsets.only(top: 12),
                      width: null,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: boxColor),
                    ),
                  ),
                ),
              ))
            ],
          )
        ],
      );
    }

    return ImageHero(
      data: widget.data,
      index: 0,
      width: null,
      height: 200,
      type: 1,
    );
  }

  List<InlineSpan> isAds(bool isAds) {
    var isTrue = [
      spanDivider(),
      const TextSpan(text: " Ads"),
    ];

    var isFalse = [
      spanDivider(),
      TextSpan(text: " ${widget.data.createdAt} "),
      // spanDivider(),
      // TextSpan(text: " ${data.type?.name.capitalize()}"),
      // TextSpan(text: " Public"),
    ];

    if (isAds == true) {
      return isTrue;
    }

    return isFalse;
  }
}

class CountText extends StatelessWidget {
  final String count;
  final String label;
  const CountText({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: count,
            style: subtitleSegoeUITextStyle.copyWith(
                fontSize: 14, color: primaryColor),
            children: [
          TextSpan(
              text: " $label",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 14, color: subColor)),
        ]));
  }
}
