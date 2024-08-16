import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';

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
    widget.navigationShell.goBranch(index);
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
                const AvatarCacheImage(
                  image: "https://picsum.photos/200/300",
                  radius: 25,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "John Doe",
                      style: titleProximaNovaTextStyle,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const ScoreWidget(scoreString: "2000")
                  ],
                ),
                Text(
                  "@johndoe",
                  style: regularProximaNovaTextStyle.copyWith(
                      fontSize: 15, color: subColor),
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
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
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

  bool isSelected(index, selectedIndex) {
    return selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, int>(
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
                      _.read<DrawerBloc>().add(DrawerChangeIndex(index));
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                    child: Text(
                      data[index],
                      style: isSelected(index, state)
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
