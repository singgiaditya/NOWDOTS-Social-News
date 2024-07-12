import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/header_banner.dart';

class SignUpComplete extends StatefulWidget {
  const SignUpComplete({super.key});

  @override
  State<SignUpComplete> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBanner(imgUrl: signupImage),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello! Welcome to",
                  style: titleSegoeUITextStyle.copyWith(
                      fontSize: 35, fontWeight: FontWeight.normal),
                ),
                Text("NOWDOTS",
                    style: titleSegoeUITextStyle.copyWith(
                        fontSize: 35, height: 0.8)),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                      text:
                          "Finally, we can stretch our bodies like the cat above. NOWDOTS is the first social-news platform that connects people, languages, and information across the globe. If you just heard about NOWDOTS and want to learn more about us, ",
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: regularSegoeUITextStyle.copyWith(
                              fontSize: 13,
                              color: buttonColor,
                            ),
                            text: "Read Here")
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        context.goNamed("home");
                      },
                      child: Text(
                        "Jump to feed",
                        style: subtitleProximaNovaTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
