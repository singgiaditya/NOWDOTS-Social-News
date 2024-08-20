import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/core/utils/string_extension.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/image_hero.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_show_menu.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/span_divider.dart';
import 'package:shimmer/shimmer.dart';

class DetailFeedCard extends StatelessWidget {
  final Feed data;

  const DetailFeedCard({super.key, required this.data});

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
              AvatarCacheImage(
                image: data.user!.picture!,
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
                      Text(
                        data.user!.name!,
                        style: titleProximaNovaTextStyle.copyWith(fontSize: 15),
                      ),
                      data.user!.isVerified!
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
                      ScoreWidget(
                        scoreString: data.user!.score!,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "${data.user!.username!} ",
                        style: regularProximaNovaTextStyle.copyWith(
                          color: subColor,
                        ),
                        children: isAds(data.isAds!)),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_horiz,
                    color: subColor,
                    size: 20,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SvgPicture.asset(upVoteOutline),
                  Text(data.forwardCount!),
                  SvgPicture.asset(downVoteOutline),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: HashtagText(
                  text: data.content!,
                  decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                      fontSize: 14, color: buttonColor),
                  regularTextStyle: regularProximaNovaTextStyle.copyWith(
                      fontSize: 14, color: primaryColor, height: 1.25),
                ),
              ),
            ],
          ),
        ),
        data.image!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 12, left: 21, right: 21),
                child: buildImages(context),
              )
            : Container(),
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
              CountText(count: data.likeCount!, label: "Likes"),
              CountText(
                count: data.commentCount!,
                label: "Comments",
              ),
              const CountText(
                count: "3",
                label: "Shares",
              ),
              CountText(
                count: data.upVoteCount ?? "0",
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
                onTap: () {},
                onLongPressStart: (details) async {
                  final offset = details.globalPosition;
                  reactionShowMenu(context, offset);
                },
                child: reactionButton(primaryColor, ReactionType.NONE),
              ),
            ),
            SvgPicture.asset(thumbDownOutline),
            SvgPicture.asset(commentOutline),
            SvgPicture.asset(share),
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

  Widget buildImages(BuildContext context) {
    if (data.image!.length == 2) {
      return Row(
        children: [
          Flexible(
            child: ImageHero(
              data: data,
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
              data: data,
              index: 1,
              width: null,
              height: 200,
              type: 3,
            ),
          )
        ],
      );
    }

    if (data.image!.length == 3) {
      return Row(
        children: [
          Flexible(
            child: ImageHero(
              data: data,
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
                  data: data,
                  index: 1,
                  width: null,
                  height: 97.5,
                  type: 4,
                ),
                const SizedBox(
                  height: 5,
                ),
                ImageHero(
                  data: data,
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

    if (data.image!.length == 4) {
      return Column(
        children: [
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: data,
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
                  data: data,
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
                  data: data,
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
                  data: data,
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

    if (data.image!.length > 4) {
      return Column(
        children: [
          Row(
            children: [
              Flexible(
                child: ImageHero(
                  data: data,
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
                  data: data,
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
                  data: data,
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
                  context.pushNamed("multiple-image", extra: data);
                },
                child: CachedNetworkImage(
                  imageUrl: data.image![3],
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
                          "+${data.image!.length - 3}",
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
      data: data,
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
      TextSpan(text: " ${data.publishedAt} "),
      spanDivider(),
      TextSpan(text: " ${data.type?.name.capitalize()}"),
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
