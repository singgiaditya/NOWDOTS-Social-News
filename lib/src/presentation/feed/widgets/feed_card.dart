import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/data/models/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/row_button_container.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:shimmer/shimmer.dart';

class FeedCard extends StatelessWidget {
  final Feed data;

  const FeedCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: data.user!.picture!,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 25,
              ),
              placeholder: (context, url) => Shimmer(
                  gradient: shimmerGradient,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: boxColor,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
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
        const SizedBox(
          height: 12,
        ),
        HashtagText(
          text: data.content!,
          decoratedTextStyle: regularProximaNovaTextStyle.copyWith(
              fontSize: 14, color: buttonColor),
          regularTextStyle: regularProximaNovaTextStyle.copyWith(
              fontSize: 14, color: primaryColor, height: 1.25),
        ),
        data.image!.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  context.pushNamed("image", extra: data.image!);
                },
                child: Hero(
                  tag: data.image!,
                  child: CachedNetworkImage(
                    imageUrl: data.image!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => Shimmer(
                      gradient: shimmerGradient,
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: boxColor),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        const SizedBox(
          height: 12,
        ),
        RowButtonContainer(
          color: primaryColor,
          backgroundColor: boxColor,
          commentCount: data.commentCount!,
          forwardCount: data.forwardCount!,
          likeCount: data.likeCount!,
          upVoteCount: data.upVoteCount ?? "0",
        ),
      ]),
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

  WidgetSpan spanDivider() {
    return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        baseline: TextBaseline.alphabetic,
        child: CircleAvatar(
          backgroundColor: subColor,
          radius: 1,
        ));
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
