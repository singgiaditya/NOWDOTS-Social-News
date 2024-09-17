import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/core/utils/reaction_utils.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/image_hero.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/row_button_container.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/span_divider.dart';
import 'package:shimmer/shimmer.dart';

class FeedCard extends StatelessWidget {
  final Feed data;
  final GestureTapCallback moreOnTap;

  const FeedCard({super.key, required this.data, required this.moreOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data.isAnonymous! == 0
                ? AvatarCacheImage(
                    image: data.user!.profilePhoto != null
                        ? "$baseUrl${data.user!.profilePhoto}"
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
                    data.isAnonymous! == 0
                        ? Text(
                            data.user!.name!,
                            style: titleProximaNovaTextStyle.copyWith(
                                fontSize: 15),
                          )
                        : Text(
                            "Anonymous",
                            style: titleProximaNovaTextStyle.copyWith(
                                fontSize: 15),
                          ),
                    data.user!.isVerified != 0 && data.isAnonymous == 0
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
                    data.isAnonymous == 0
                        ? ScoreWidget(
                            scoreString:
                                data.user?.profile?.repScore.toString() ??
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
                      text: data.isAnonymous! == 0
                          ? "@${data.user!.username!} "
                          : "@anonymous ",
                      style: regularProximaNovaTextStyle.copyWith(
                        color: subColor,
                      ),
                      children: isAds(data.isAd! != 0)),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: moreOnTap,
                child: Icon(
                  Icons.more_horiz,
                  color: subColor,
                  size: 20,
                ))
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        data.content != null
            ? HashtagText(
                text: data.content ?? "",
                decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
                    fontSize: 14, color: buttonColor),
                regularTextStyle: regularProximaNovaTextStyle.copyWith(
                    fontSize: 14, color: primaryColor, height: 1.25),
              )
            : Container(),
        data.photos!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 12),
                child: buildImages(context),
              )
            : Container(),
        data.shareId != null && data.content != null
            ? SizedBox(
                height: 12,
              )
            : SizedBox(),
        data.shareId != null ? _buildQuoteShare() : Container(),
        const SizedBox(
          height: 12,
        ),
        RowButtonContainer(
            color: primaryColor,
            backgroundColor: boxColor,
            data: data,
            reactionType:
                getReactionTypeFromListData(data.likes, data.dislikes)),
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
              data.isAnonymous! == 0
                  ? AvatarCacheImage(
                      image: data.share!.user!.profilePhoto != null
                          ? "$baseUrl${data.share!.user!.profilePhoto}"
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
                  data.isAnonymous! == 0
                      ? Container(
                          constraints: BoxConstraints(maxWidth: 95),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            data.share!.user!.name!,
                            style: titleProximaNovaTextStyle.copyWith(
                                fontSize: 15),
                          ),
                        )
                      : Text(
                          "Anonymous",
                          style:
                              titleProximaNovaTextStyle.copyWith(fontSize: 15),
                        ),
                  data.user!.isVerified != 0 && data.isAnonymous == 0
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
                  data.isAnonymous == 0
                      ? SizedBox(
                          height: 20,
                          child: ScoreWidget(
                            scoreString:
                                data.user?.profile?.repScore.toString() ??
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
                      constraints: BoxConstraints(maxWidth: 60),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        "@${data.share?.user?.username}",
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
            text: data.share?.content ?? " ",
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
    if (data.photosCount! == 2) {
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

    if (data.photosCount! == 3) {
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

    if (data.photosCount! == 4) {
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

    if (data.photosCount! > 4) {
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
                  context.pushNamed("image",
                      extra: data, pathParameters: {"index": "3"});
                },
                child: CachedNetworkImage(
                  imageUrl: data.photos![3],
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
                          "+${data.photos!.length - 3}",
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
      //todo: add date
      TextSpan(text: " ${data.createdAt} "),
      // TextSpan(text: " 1j "),
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
