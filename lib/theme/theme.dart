import 'package:flutter/material.dart';

import '../design/design.dart';

const String fontFamilyMontserrat = "Montserrat";

final darkTheme = ThemeData(
    // useMaterial3: false,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: mainTextColor),
      titleTextStyle: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w700,
        fontSize: 25,
        letterSpacing: 0,
        color: mainTextColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 35,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w700,
        fontSize: 25,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 25,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        letterSpacing: 0,
        color: successColor,
      ),
    ));
