import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nowdots_social_news/src/config/routes/route.dart';
import 'package:nowdots_social_news/src/config/themes/app_themes.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/injection_container.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_pass/forgot_pass_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_password_set_new_password/forgot_password_set_new_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_password_verification_code/forgot_password_verification_code_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/create_account/create_account_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_code_verification/register_code_verification_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_password/register_set_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_profile_picture/register_set_profile_picture_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_username/register_set_username_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/comment_feed/comment_feed_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/comment_replies/comment_replies_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_followiing_feeds/get_all_following_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_detail_feed/get_detail_feed_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/reaction/reaction_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/vote/vote_bloc.dart';
import 'package:nowdots_social_news/src/presentation/splash_screen/bloc/splash_screen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializieDependencies();
  await GetIt.instance.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
          create: (context) => sl()..add(SplashScreenEvent.checkAuth()),
        ),
        BlocProvider<GetAllFeedsBloc>(
          create: (context) => sl()..add(GetAllFeedsEvent.getAllFeeds()),
        ),
        BlocProvider<GetAllFollowingFeedsBloc>(
          create: (context) => sl()
            ..add(GetAllFollowingFeedsEvent.getAllFollowingFeeds(
                FeedType.NOWDOTS)),
        ),
        BlocProvider<ReactionBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<VoteBloc>(
          create: (context) => sl(),
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
        BlocProvider<LoginBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<ForgotPassBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<ForgotPasswordVerificationCodeBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<ForgotPasswordSetNewPasswordBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<LogoutBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<GetDetailFeedBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<CommentFeedBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<GetUserBloc>(
          create: (context) => sl()..add(GetUserEvent.getLocalUser()),
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
