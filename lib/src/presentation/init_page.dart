import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/core/utils/string_extension.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_followiing_feeds/get_all_following_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';

class InitPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const InitPage(
      {super.key, required this.navigationShell, required this.scaffoldKey});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int selectedIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: widget.navigationShell,
      bottomNavigationBar: _buildBottomNavBar(),
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<GetUserBloc, GetUserState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return GestureDetector(
                          onTap: () {
                            widget.scaffoldKey.currentState!.closeDrawer();
                            context.goNamed("my-profile");
                          },
                          child: AvatarCacheImage(
                            image: " ",
                            radius: 25,
                          ),
                        );
                      },
                      loaded: (data) {
                        return GestureDetector(
                          onTap: () {
                            widget.scaffoldKey.currentState!.closeDrawer();
                            context.pushNamed("my-profile");
                          },
                          child: AvatarCacheImage(
                            image: "$baseUrl${data.profilePhoto}",
                            radius: 25,
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<GetUserBloc, GetUserState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Row(
                          children: [
                            Text(
                              "   ",
                              style: titleProximaNovaTextStyle,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const ScoreWidget(scoreString: "TBD")
                          ],
                        );
                      },
                      loaded: (data) {
                        return Row(
                          children: [
                            Text(
                              "${data.name}",
                              style: titleProximaNovaTextStyle,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            ScoreWidget(
                                scoreString:
                                    data.profile?.repScore.toString() ?? "TBD")
                          ],
                        );
                      },
                    );
                  },
                ),
                BlocBuilder<GetUserBloc, GetUserState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Text(
                          "@johndoe",
                          style: regularProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: subColor),
                        );
                      },
                      loaded: (data) {
                        return Text(
                          "@${data.username}",
                          style: regularProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: subColor),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "142 ",
                            style: titleProximaNovaTextStyle.copyWith(
                                color: primaryColor),
                            children: [
                          TextSpan(
                              text: "Following",
                              style: regularProximaNovaTextStyle.copyWith(
                                fontSize: 16,
                              ))
                        ])),
                    const SizedBox(
                      width: 8,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "272 ",
                            style: titleProximaNovaTextStyle.copyWith(
                                color: primaryColor),
                            children: [
                          TextSpan(
                              text: "Follower",
                              style: regularProximaNovaTextStyle.copyWith(
                                fontSize: 16,
                              ))
                        ])),
                  ],
                ),
                const SizedBox(
                  height: 54,
                ),
                DrawerNavigation(
                  scaffoldKey: widget.scaffoldKey,
                  selectedTextStyle: titleProximaNovaTextStyle.copyWith(
                      fontSize: 20, color: primaryColor),
                  unselectedTextStyle: regularProximaNovaTextStyle.copyWith(
                      fontSize: 20, color: primaryColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                ExpansionTile(
                  shape: const Border(),
                  title: Text(
                    "Setting and Support",
                    style: titleProximaNovaTextStyle.copyWith(
                        fontSize: 15, color: primaryColor),
                  ),
                  expandedAlignment: Alignment.centerLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Profile",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Notifications",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Chats",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Appereance",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Appereance",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Settings",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Help Center",
                          style: titleProximaNovaTextStyle.copyWith(
                              fontSize: 15, color: primaryColor),
                        )),
                    BlocConsumer<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          error: (message) => showSnackBar(context, message),
                          loaded: (data) => context.goNamed("boarding"),
                        );
                      },
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      textAlign: TextAlign.center,
                                      'Logging out',
                                      style: titleSegoeUITextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Are you sure to log out of Nowdots?',
                                          style:
                                              regularSegoeUITextStyle.copyWith(
                                                  fontSize: 14,
                                                  color: subColor),
                                        ),
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Divider(
                                          color: boxColor,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<LogoutBloc>().add(
                                                const LogoutEvent.logout());
                                          },
                                          child: Text(
                                            'Log out',
                                            style:
                                                titleSegoeUITextStyle.copyWith(
                                                    fontSize: 15,
                                                    color: score2Color),
                                          ),
                                        ),
                                        Divider(
                                          color: boxColor,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: regularSegoeUITextStyle
                                                .copyWith(
                                                    fontSize: 15,
                                                    color: primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Log out",
                              style: titleProximaNovaTextStyle.copyWith(
                                  fontSize: 15, color: score2Color),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            _goToBranch(selectedIndex);
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(homeOutline),
            activeIcon: SvgPicture.asset(homeFilled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(newsOutline),
            activeIcon: SvgPicture.asset(newsFilled),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(notificationOutline),
            activeIcon: SvgPicture.asset(notificationFilled),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(settingOutline),
            activeIcon: SvgPicture.asset(settingFilled),
            label: "Setting",
          ),
        ]);
  }
}

class DrawerNavigation extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  const DrawerNavigation({
    super.key,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
    required this.scaffoldKey,
  });

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final List<String> data = [
    "Nowdots",
    "Nowher",
    "Nowfoodie",
    "Nowplay",
    "Nowsports",
    "Nowhype",
  ];

  final List<FeedType> dataType = [
    FeedType.NOWDOTS,
    FeedType.NOWHER,
    FeedType.NOWFOODIE,
    FeedType.NOWPLAY,
    FeedType.NOWSPORT,
    FeedType.NOWHYPE,
  ];

  bool isSelected(index, selectedIndex) {
    return selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, FeedType>(
      builder: (_, state) {
        return ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      _
                          .read<DrawerBloc>()
                          .add(DrawerChangeType(dataType[index]));
                      _
                          .read<GetAllFeedsBloc>()
                          .add(GetAllFeedsEvent.changeFeeds(dataType[index]));
                      _.read<GetAllFollowingFeedsBloc>().add(
                          GetAllFollowingFeedsEvent.getAllFollowingFeeds(
                              dataType[index]));
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                    child: Text(
                      dataType[index].name.capitalize(),
                      style: isSelected(dataType[index], state)
                          ? widget.selectedTextStyle
                          : widget.unselectedTextStyle,
                    )),
              ],
            );
          },
        );
      },
    );
  }
}
