import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/header_banner.dart';

class ForgotPasswordCompleteView extends StatefulWidget {
  const ForgotPasswordCompleteView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordCompleteView> createState() =>
      _ForgotPasswordCompleteViewState();
}

class _ForgotPasswordCompleteViewState
    extends State<ForgotPasswordCompleteView> {
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
          HeaderBanner(imgUrl: forgotPasswordImage),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're all set!",
                  style: titleSegoeUITextStyle.copyWith(
                      fontSize: 35, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "You’ve successfully changed your password.\n\nYou can always change your password anytime in the future or in case when someone you don’t know try to logging in to your account, you can add an extra layer of security to your account with two-factor authentication. Enable it in your settings to help make sure that you, and only you, can access your account.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 13, color: subColor),
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
