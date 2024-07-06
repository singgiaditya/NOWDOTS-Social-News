import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "Segoe UI",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    tabBarTheme: const TabBarTheme(),
    iconButtonTheme: iconButtonThemeData(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData()
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
    centerTitle: true,
    titleTextStyle: titleSegoeUITextStyle.copyWith(color: primaryColor),
    actionsIconTheme: IconThemeData(color: primaryColor),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
    indicatorColor: primaryColor,
    labelStyle: subtitleSegoeUITextStyle,
    unselectedLabelStyle: subtitleSegoeUITextStyle,
    labelColor: primaryColor,
    unselectedLabelColor: thirdColor,
  );
}

IconButtonThemeData iconButtonThemeData() {
  return IconButtonThemeData(
      style:
          ButtonStyle(iconColor: WidgetStatePropertyAll<Color>(primaryColor)));
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: thirdColor,
    selectedLabelStyle: regularSegoeUITextStyle,
    unselectedLabelStyle: regularSegoeUITextStyle,
  );
}
