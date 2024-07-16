import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/data/models/feed_model.dart';

class FeedCard extends StatelessWidget {
  final FeedModel data;

  const FeedCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 21),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(data.user.picture),
              radius: 25,
            ),
            SizedBox(
              width: 9,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.user.name,
                      style: titleProximaNovaTextStyle.copyWith(fontSize: 15),
                    ),
                    data.user.isVerified
                        ? Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.verified,
                              color: buttonColor,
                              size: 15,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: 4,
                    ),
                    ScoreWidget(),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                RichText(
                  text: TextSpan(
                      text: "${data.user.username} ",
                      style: regularProximaNovaTextStyle.copyWith(
                        color: subColor,
                      ),
                      children: [
                        spanDivider(),
                        TextSpan(text: " ${data.published_at} "),
                        spanDivider(),
                        TextSpan(text: " ${data.type} "),
                      ]),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_horiz,
                  color: subColor,
                  size: 20,
                ))
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          data.content,
          style: regularProximaNovaTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            like_dislike_button(),
            CommentButton(),
            ForwardButton(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                  color: boxColor, borderRadius: BorderRadius.circular(80)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(upVoteOutline),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    data.upVoteCount,
                    style: regularProximaNovaTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(downVoteOutline),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }

  Row ForwardButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(forward),
        SizedBox(
          width: 1,
        ),
        Text(
          data.forwardCount,
          style: regularProximaNovaTextStyle.copyWith(fontSize: 16),
        )
      ],
    );
  }

  Row CommentButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(commentOutline),
        SizedBox(
          width: 1,
        ),
        Text(
          data.commentCount,
          style: regularProximaNovaTextStyle.copyWith(fontSize: 16),
        )
      ],
    );
  }

  Row like_dislike_button() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadiusDirectional.horizontal(
                  start: Radius.circular(80))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(thumbUpOutline),
              Text(
                data.likeCount,
                style: regularProximaNovaTextStyle.copyWith(fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          width: 1.5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius:
                  BorderRadiusDirectional.horizontal(end: Radius.circular(80))),
          child: SvgPicture.asset(thumbDownOutline),
        )
      ],
    );
  }

  Container ScoreWidget() {
    Color color = primaryColor;
    final score = int.tryParse(data.user.score);
    if (score != null) {
      if (score <= 0) {
        color = score2Color;
      }
      if (score > 0) {
        color = score3Color;
      }
      if (score > 100) {
        color = score4Color;
      }
      if (score > 200) {
        color = score5Color;
      }
      if (score > 500) {
        color = score6Color;
      }
      if (score > 900) {
        color = score7Color;
      }
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 2)),
      child: Text("${data.user.score}",
          style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15, color: color, fontWeight: FontWeight.w600)),
    );
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
