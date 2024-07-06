import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/presentation/init_page.dart';

class AppRoute {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  // Home
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'Home',
  );

  // News
  static final _shellNavigatorNews = GlobalKey<NavigatorState>(
    debugLabel: 'News',
  );

  // Notifications
  static final _shellNavigatorNotifications = GlobalKey<NavigatorState>(
    debugLabel: 'Notifications',
  );

  // Settings
  static final _shellNavigatorSettings = GlobalKey<NavigatorState>(
    debugLabel: 'Settings',
  );

  static GoRouter router =
      GoRouter(
        navigatorKey: _rootNavigatorKey, initialLocation: "/home", routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return InitPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _shellNavigatorHome, routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorHome,
              path: "/home",
              name: "home",
              builder: (context, state) => const Text("Home"),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorNews, routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorNews,
              path: "/news",
              name: "news",
              builder: (context, state) => const Text("News"),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorNotifications, routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorNotifications,
              path: "/notifications",
              name: "notifications",
              builder: (context, state) => const Text("Notifications"),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorSettings, routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorSettings,
              path: "/settings",
              name: "settings",
              builder: (context, state) => const Text("Settings"),
            ),
          ]),
        ])
  ]);
}
