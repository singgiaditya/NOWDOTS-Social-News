import 'package:flutter/material.dart';
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
import 'package:nowdots_social_news/src/presentation/feed/pages/detail_feed_view.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/feed_view.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/fullscreen_image.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/multple_image.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/post_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/report_continue.dart';
import 'package:nowdots_social_news/src/presentation/feed/pages/report_reason.dart';
import 'package:nowdots_social_news/src/presentation/init_page.dart';
import 'package:nowdots_social_news/src/presentation/profile/pages/profile_view.dart';
import 'package:nowdots_social_news/src/presentation/splash_screen/splash_screen.dart';

class AppRoute {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      initialLocation: "/splash-screen",
      routes: [
        //splash screen
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: "/splash-screen",
          name: "splash-screen",
          builder: (context, state) => const SplashScreen(),
        ),

        // home (navigation bar)
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return InitPage(
                navigationShell: navigationShell,
                scaffoldKey: _scaffoldKey,
              );
            },
            branches: [
              StatefulShellBranch(navigatorKey: _shellNavigatorHome, routes: [
                GoRoute(
                    parentNavigatorKey: _shellNavigatorHome,
                    path: "/home",
                    name: "home",
                    pageBuilder: (context, state) => NoTransitionPage(
                            child: FeedView(
                          parentKey: _scaffoldKey,
                        )),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _shellNavigatorHome,
                        path: "my-profile",
                        name: "my-profile",
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            key: state.pageKey,
                            child: ProfileView(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.fastOutSlowIn;

                              final tween = Tween(begin: begin, end: end);
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: curve,
                              );

                              return SlideTransition(
                                position: tween.animate(curvedAnimation),
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: "report",
                        name: "report",
                        pageBuilder: (context, state) {
                          return CustomTransitionPage(
                            key: state.pageKey,
                            child: ReportReason(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              final tween = Tween(begin: begin, end: end);
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: curve,
                              );

                              return SlideTransition(
                                position: tween.animate(curvedAnimation),
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: "report-continue",
                        name: "report-continue",
                        builder: (context, state) => const ReportContinue(),
                      ),
                    ]),
              ]),
              StatefulShellBranch(navigatorKey: _shellNavigatorNews, routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorNews,
                  path: "/news",
                  name: "news",
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: Text("News")),
                ),
              ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorNotifications,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorNotifications,
                      path: "/notifications",
                      name: "notifications",
                      pageBuilder: (context, state) =>
                          NoTransitionPage(child: Text("Notifications")),
                    ),
                  ]),
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorSettings,
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorSettings,
                      path: "/settings",
                      name: "settings",
                      pageBuilder: (context, state) =>
                          NoTransitionPage(child: Text("Settings")),
                    ),
                  ]),
            ]),
        //boarding page
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "/boarding",
            name: "boarding",
            builder: (context, state) => const BoardingView(),
            routes: [
              //sign-in
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

                    //forgot-password
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: "forgot-password",
                      name: "forgot-password",
                      builder: (context, state) => const ForgotPasswordView(),
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

              //sign-up
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

        //fulscreen-image
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: "/image/:index",
          name: "image",
          builder: (context, state) => const FullscreenImage(),
        ),

        //fullscreen multiple-image
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: "/multiple-image",
          name: "multiple-image",
          builder: (context, state) => const MultipleImage(),
        ),

        //detail-feed
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: "/detail-feed",
          name: "detail-feed",
          builder: (context, state) => const DetailFeedView(),
        ),
        //post-feed
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: "/post-feed",
          name: "post-feed",
          builder: (context, state) => const PostFeed(),
        ),
      ]);
}
