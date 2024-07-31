import 'package:flutter/material.dart';

class HashtagText extends StatelessWidget {
  final String text;
  final TextStyle regularTextStyle;
  final TextStyle decoratedTextStyle;

  HashtagText(
      {Key? key,
      required this.text,
      required this.regularTextStyle,
      required this.decoratedTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'[#@]\w+');
    final spans = text.split(" ").map(
      (match) {
        if (regex.hasMatch(match)) {
          return TextSpan(text: match + " ", style: decoratedTextStyle);
        } else {
          return TextSpan(
            text: match + " ",
          );
        }
      },
    ).toList();

    return RichText(
      text: TextSpan(style: regularTextStyle, children: spans),
    );
  }
}
