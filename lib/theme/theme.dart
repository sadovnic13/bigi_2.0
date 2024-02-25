import 'package:flutter/material.dart';

import '../design/design.dart';

const String fontFamilyMontserrat = "Montserrat";

final darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceColor,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 25,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        letterSpacing: 0,
        color: mainTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        letterSpacing: 0,
        color: successColor,
      ),
    ));
