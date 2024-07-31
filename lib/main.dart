import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/config/routes/route.dart';
import 'package:nowdots_social_news/src/config/themes/app_themes.dart';
import 'package:nowdots_social_news/src/injection_container.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/create_account/create_account_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_code_verification/register_code_verification_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_password/register_set_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_profile_picture/register_set_profile_picture_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_username/register_set_username_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializieDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllFeedsBloc>(
          create: (context) => sl()..add(GetAllFeedsEvent.getAllFeeds()),
        ),
        BlocProvider<DrawerBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<CreateAccountBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RegisterCodeVerificationBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RegisterSetPasswordBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RegisterSetProfilePictureBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RegisterSetUsernameBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Nowdots Social News',
        theme: appTheme(),
        themeMode: ThemeMode.light,
        routerConfig: AppRoute.router,
      ),
    );
  }
}
