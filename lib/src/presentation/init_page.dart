import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';

class InitPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const InitPage({super.key, required this.navigationShell});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int selectedIndex = 0;
  void _goToBranch(int index){
    widget.navigationShell.goBranch(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: _buildBottomNavBar(),
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
          icon: SvgPicture.asset(home_outline),
          activeIcon: SvgPicture.asset(home_filled),
          label: "Home",
          ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(news_outline),
          activeIcon: SvgPicture.asset(news_filled),
          label: "News",),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(notification_outline),
          activeIcon: SvgPicture.asset(notification_filled),
          label: "Notification",
          ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(setting_outline),
          activeIcon: SvgPicture.asset(setting_filled),
          label: "Setting",
          ),
    ]);
  }
}
