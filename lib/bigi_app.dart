import 'package:bigi/router/router.dart';
import 'package:bigi/theme/theme.dart';
import 'package:flutter/material.dart';


class BigiApp extends StatelessWidget {
  const BigiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
