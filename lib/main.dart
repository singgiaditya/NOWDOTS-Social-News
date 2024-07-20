import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/config/routes/route.dart';
import 'package:nowdots_social_news/src/config/themes/app_themes.dart';
import 'package:nowdots_social_news/src/data/datasources/local/feed/feed_local_datasources.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllFeedsBloc(FeedLocalDatasources())
            ..add(GetAllFeedsEvent.getAllFeeds()),
        ),
        BlocProvider(create: (context) => DrawerBloc(),)
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
