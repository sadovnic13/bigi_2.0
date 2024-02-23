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
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: fontFamilyMontserrat,
        fontWeight: FontWeight.w400,
        fontSize: 40,
        color: mainTextColor,
      ),
    ));
