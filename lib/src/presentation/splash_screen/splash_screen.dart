import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';
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
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Nowdots",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 40, fontWeight: FontWeight.w800, height: 0),
                    ),
                    Text(
                      "Social News",
                      style: regularProximaNovaTextStyle.copyWith(
                        fontSize: 24,
                        letterSpacing: 5,
                      ),
                    ),
                  ],
                ),
                LogoList()
              ],
            ),
          ),
        );
      },
    );
  }
}
