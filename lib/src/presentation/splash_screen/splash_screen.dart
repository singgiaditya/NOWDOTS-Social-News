import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/splash_screen/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          notAuth: () {
            context.goNamed("boarding");
          },
          withAuth: () {
            context.goNamed("home");
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(250, 255, 0, 1),
          body: SafeArea(
              child: Center(
            child: Text(
              "N",
              style: titleProximaNovaTextStyle.copyWith(
                  fontSize: 75,
                  fontWeight: FontWeight.w900,
                  color: primaryColor),
            ),
          )),
        );
      },
    );
  }
}
