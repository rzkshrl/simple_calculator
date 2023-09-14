import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

Color light = HexColor('#FFFFFF');
Color grey = HexColor('##d9d9d9');
Color dark = HexColor('#000000');
Color lightPrimaryColor = HexColor('#F1F0E8');
Color darkPrimaryColor = HexColor('#253943');
Color secondaryColor = HexColor('#eaf0f3');
Color accentColor = HexColor('#eff3f5');
Color secondaryDarkColor = HexColor('#4a7386');
Color accentDarkColor = HexColor('#557d8e');

class ThemeClass {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: dark,
      iconTheme: IconThemeData(
        color: lightPrimaryColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: dark,
      ),
    ),
    primaryColor: accentDarkColor,
    cardTheme: CardTheme(
      color: light,
    ),
    iconTheme: IconThemeData(
      color: light,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: light,
        fontSize: 16.sp,
      ),
      headlineMedium: TextStyle(
        color: light,
        fontSize: 14.sp,
      ),
      headlineSmall: TextStyle(
        color: light,
        fontSize: 12.sp,
      ),
      displayLarge: TextStyle(
        color: grey,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: light,
      iconTheme: IconThemeData(
        color: darkPrimaryColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: light,
      ),
    ),
    primaryColor: accentColor,
    cardTheme: CardTheme(
      color: dark,
    ),
    iconTheme: IconThemeData(
      color: dark,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: dark,
        fontSize: 16.sp,
      ),
      headlineMedium: TextStyle(
        color: dark,
        fontSize: 14.sp,
      ),
      headlineSmall: TextStyle(
        color: dark,
        fontSize: 12.sp,
      ),
      displayLarge: TextStyle(
        color: grey,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: grey,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
