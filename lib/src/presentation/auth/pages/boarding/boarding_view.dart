import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/custom_divider.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/dark_button.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/sign_button.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoList(),
            _buildTitle(),
            _buildSignUpButton(context),
            _buildSignInTextButton(context)
          ],
        ),
      )),
    ));
  }

  Center _buildSignInTextButton(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
              text: "Already have an account? ",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 13, color: primaryColor),
              children: [
            WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: GestureDetector(
                    onTap: () {
                      context.goNamed("sign-in");
                    },
                    child: Text(
                      "Log in",
                      style: regularProximaNovaTextStyle.copyWith(
                          fontSize: 13, color: buttonColor),
                    )))
          ])),
    );
  }

  Column _buildSignUpButton(BuildContext context) {
    return Column(
      children: [
        const IconSignButton(label: "Sign up with google", svg: googleIcon),
        const SizedBox(
          height: 18,
        ),
        const IconSignButton(label: "Sign up with apple", svg: appleIcon),
        const SizedBox(
          height: 18,
        ),
        const CustomDivider(),
        const SizedBox(
          height: 18,
        ),
        DarkButton(
          label: "Create account",
          onTap: () => context.goNamed("sign-up"),
        ),
        const SizedBox(
          height: 14,
        ),
        const _BuildTermsOfService(),
      ],
    );
  }

  Column _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
              text: "Let the ",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 35, color: primaryColor),
              children: [
                TextSpan(
                    text: "world",
                    style: titleSegoeUITextStyle.copyWith(fontSize: 35)),
              ]),
        ),
        Text(
          "hear your stories.",
          style: regularSegoeUITextStyle.copyWith(fontSize: 35, height: 0.5),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Discover stories, news, trends from everywhere, everyone, every time in your languange for free",
          style: regularSegoeUITextStyle.copyWith(fontSize: 13),
        ),
      ],
    );
  }
}

class _BuildTermsOfService extends StatelessWidget {
  const _BuildTermsOfService();

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "By signing up, you agree to the ",
            style:
                regularSegoeUITextStyle.copyWith(fontSize: 11, color: subColor),
            children: [
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Terms of Service",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor)),
          TextSpan(
              text: " and ",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: subColor)),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Privacy Policy",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor)),
          TextSpan(
              text: " including ",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: subColor)),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Cookie Policy",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor)),
        ]));
  }
}
