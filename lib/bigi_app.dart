import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class BigiApp extends StatelessWidget {
  const BigiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      // initialRoute: '/home_page_screen',
      initialRoute: '/log_page_screen',
    );
  }
}
