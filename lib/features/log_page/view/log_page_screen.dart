import 'package:bigi/design/design.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LogPageScreen extends StatefulWidget {
  const LogPageScreen({super.key});

  @override
  State<LogPageScreen> createState() => _LogPageScreenState();
}

class _LogPageScreenState extends State<LogPageScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 175,
              width: 175,
              margin: const EdgeInsets.only(top: 25, bottom: 10),
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(200),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: successColor,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: user,
            ),
            const InputForm(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Еще нет аккаунта?',
                    style: TextStyle(color: secondTextColor),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/reg_page_screen');
                    },
                    child: const Text(
                      'Регистрируйся',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
