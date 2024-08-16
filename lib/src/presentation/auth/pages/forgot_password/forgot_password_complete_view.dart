import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/header_banner.dart';

class ForgotPasswordCompleteView extends StatefulWidget {
  const ForgotPasswordCompleteView({super.key});

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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    final LoginRequestModel data =
        GoRouterState.of(context).extra as LoginRequestModel;
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderBanner(imgUrl: forgotPasswordImage),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You're all set!",
                  style: titleSegoeUITextStyle.copyWith(
                      fontSize: 35, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "You’ve successfully changed your password.\n\nYou can always change your password anytime in the future or in case when someone you don’t know try to logging in to your account, you can add an extra layer of security to your account with two-factor authentication. Enable it in your settings to help make sure that you, and only you, can access your account.",
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 13, color: subColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        loaded: (data) => context.goNamed("home"),
                        error: (message) => showSnackBar(context, message));
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: () => _buildNextButton(context, data),
                        loaded: (dataResponse) =>
                            _buildNextButton(context, data),
                        loading: () => _buildLoadingNextButton());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Align _buildNextButton(BuildContext context, LoginRequestModel data) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(LoginEvent.login(data));
          },
          child: Text(
            "Jump to feed",
            style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )),
    );
  }

  Align _buildLoadingNextButton() {
    return const Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: null,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )),
    );
  }
}
