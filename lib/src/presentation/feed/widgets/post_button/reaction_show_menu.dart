import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

Future<dynamic> reactionShowMenu(BuildContext context, Offset offset) {
  return showMenu(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      surfaceTintColor: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy - 100,
        MediaQuery.of(context).size.width - offset.dx,
        MediaQuery.of(context).size.height - offset.dy,
      ),
      items: [
        PopupMenuItem(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      const Text(
                        "👍",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "Good",
                        style: regularProximaNovaTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    const Text(
                      "😇",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Kind",
                      style: regularProximaNovaTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    const Text(
                      "😎",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Smart",
                      style: regularProximaNovaTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    const Text(
                      "🥰",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Wise",
                      style: regularProximaNovaTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    const Text(
                      "❤️",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Helpful",
                      style: regularProximaNovaTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ]);
}
