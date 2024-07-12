import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/boarding/boarding_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/forgot_password/forgot_password_code_verification_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/forgot_password/forgot_password_complete_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/forgot_password/forgot_password_new_password_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/forgot_password/forgot_password_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_in/sign_in_email_username_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_in/sign_in_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_code_verification_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_complete.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_create_password_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_pick_picture_view.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_pick_username.dart';
import 'package:nowdots_social_news/src/presentation/auth/pages/sign_up/sign_up_view.dart';
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

  static GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/boarding",
      routes: [
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
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorNotifications,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorNotifications,
                      path: "/notifications",
                      name: "notifications",
                      builder: (context, state) => const Text("Notifications"),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorSettings,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorSettings,
                      path: "/settings",
                      name: "settings",
                      builder: (context, state) => const Text("Settings"),
                    ),
                  ]),
            ]),
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "/boarding",
            name: "boarding",
            builder: (context, state) => const BoardingView(),
            routes: [
              GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: "sign-in",
                  name: "sign-in",
                  builder: (context, state) => const SignInView(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-in-email",
                      name: "sign-in-email",
                      builder: (context, state) =>
                          const SignInEmailUsernameView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "forgot-password",
                      name: "forgot-password",
                      builder: (context, state) =>
                          const ForgotPasswordView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "forgot-password-code-verification",
                      name: "forgot-password-code-verification",
                      builder: (context, state) =>
                          const ForgotPasswordCodeVerificationView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "forgot-password-new-password",
                      name: "forgot-password-new-password",
                      builder: (context, state) =>
                          const ForgotPasswordNewPasswordView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "forgot-password-complete",
                      name: "forgot-password-complete",
                      builder: (context, state) =>
                          const ForgotPasswordCompleteView(),
                    ),
                  ]),
              GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: "sign-up",
                  name: "sign-up",
                  builder: (context, state) => const SignUpView(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-up-code-verification",
                      name: "sign-up-code-verification",
                      builder: (context, state) =>
                          const SignUpCodeVerificationView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-up-create-password",
                      name: "sign-up-create-password",
                      builder: (context, state) =>
                          const SignUpCreatePasswordView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-up-pick-picture",
                      name: "sign-up-pick-picture",
                      builder: (context, state) =>
                          const SignUpPickPictureView(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-up-pick-username",
                      name: "sign-up-pick-username",
                      builder: (context, state) => const SignUpPickUsername(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "sign-up-complete",
                      name: "sign-up-complete",
                      builder: (context, state) => const SignUpComplete(),
                    )
                  ]),
            ]),
          
      ]);
}
