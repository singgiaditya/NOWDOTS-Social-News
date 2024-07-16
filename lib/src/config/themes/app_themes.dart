import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "Segoe UI",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    tabBarTheme: tabBarTheme(),
    iconButtonTheme: iconButtonThemeData(),
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
    elevatedButtonTheme: elevatedButtonTheme(),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
    centerTitle: true,
    titleTextStyle:
        titleSegoeUITextStyle.copyWith(color: primaryColor, fontSize: 18),
    actionsIconTheme: IconThemeData(color: primaryColor),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
      labelStyle: subtitleSegoeUITextStyle,
      unselectedLabelStyle: subtitleSegoeUITextStyle,
      labelColor: primaryColor,
      unselectedLabelColor: thirdColor,
      dividerColor: boxColor,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
              color: primaryColor, width: 3, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(80)));
}

IconButtonThemeData iconButtonThemeData() {
  return IconButtonThemeData(
      style:
          ButtonStyle(iconColor: WidgetStatePropertyAll<Color>(primaryColor)));
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    selectedLabelStyle: regularSegoeUITextStyle.copyWith(color: primaryColor),
    unselectedLabelStyle: regularSegoeUITextStyle.copyWith(color: primaryColor),
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        textStyle: subtitleProximaNovaTextStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: boxColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    hintStyle:
        regularProximaNovaTextStyle.copyWith(color: thirdColor, fontSize: 15),
    labelStyle:
        regularProximaNovaTextStyle.copyWith(color: primaryColor, fontSize: 15),
  );
}
