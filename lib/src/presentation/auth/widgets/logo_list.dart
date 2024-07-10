import 'package:flutter/material.dart';
  import 'package:nowdots_social_news/src/core/constant/logos.dart';

class LogoList extends StatelessWidget {
  const LogoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          nowfoodieLogo,
          scale: 2.5,
        ),
        Image.asset(
          nowherLogo,
          scale: 2.5,
        ),
        Image.asset(
          nowplayLogo,
          scale: 2.5,
        ),
        Image.asset(
          nowdotsLogo,
          scale: 1.8,
        ),
        Image.asset(
          nowsportsLogo,
          scale: 2.5,
        ),
        Image.asset(
          nowhypeLogo,
          scale: 2.5,
        ),
      ],
    );
  }
}