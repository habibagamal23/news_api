import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_mangment.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: ColorsManager.mainBlue,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyles.headline1,
      displayMedium: TextStyles.headline2,
      titleMedium: TextStyles.subtitle1,
      bodyLarge: TextStyles.bodyText1,
      bodyMedium: TextStyles.bodyText2,
      labelLarge: TextStyles.button,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyles.headline1Dark,
      displayMedium: TextStyles.headline2Dark,
      titleMedium: TextStyles.subtitle1Dark,
      bodyLarge: TextStyles.bodyText1Dark,
      bodyMedium: TextStyles.bodyText2Dark,
      labelLarge: TextStyles.buttonDark,
    ),
  );
}

class TextStyles {
  static TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey.shade600,
  );

  static TextStyle bodyText1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.grey.shade600,
  );

  static TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Dark theme text styles
  static TextStyle headline1Dark = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle headline2Dark = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Colors.white70,
  );

  static TextStyle subtitle1Dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white60,
  );

  static TextStyle bodyText1Dark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  static TextStyle bodyText2Dark = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: Colors.white60,
  );

  static TextStyle buttonDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
