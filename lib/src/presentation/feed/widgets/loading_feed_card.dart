import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';

class LoadingFeedCard extends StatelessWidget {
  const LoadingFeedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: boxColor,
            ),
            const SizedBox(
              width: 9,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: boxColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 180,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: boxColor),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: boxColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: boxColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: boxColor),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: boxColor),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: boxColor),
            ),
            Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: boxColor),
            ),
            Container(
              width: 50,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: boxColor),
            ),
            Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: boxColor),
            ),
          ],
        )
      ]),
    );
  }
}
