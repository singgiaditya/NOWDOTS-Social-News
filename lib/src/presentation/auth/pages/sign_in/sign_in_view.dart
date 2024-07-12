import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/custom_divider.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/dark_button.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/header_banner.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/sign_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
          HeaderBanner(
            imgUrl: signinImage,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 37),
            child: Column(
              children: [
                const LogoList(),
                const SizedBox(
                  height: 39,
                ),
                const IconSignButton(
                    svg: googleIcon, label: "Sign in with Google"),
                const SizedBox(
                  height: 18,
                ),
                const IconSignButton(
                    svg: appleIcon, label: "Sign in with Apple"),
                const SizedBox(
                  height: 18,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 18,
                ),
                DarkButton(
                  label: "Email or @username",
                  onTap: () {
                    context.goNamed("sign-in-email");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
