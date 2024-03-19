import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../widgets/widgets.dart';

class RegPageScreen extends StatefulWidget {
  const RegPageScreen({super.key});

  @override
  State<RegPageScreen> createState() => _RegPageScreenState();
}

class _RegPageScreenState extends State<RegPageScreen> {
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
              child: user_add,
            ),
            const InputForm(),

            // not a member? register now
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Уже есть аккаунт?',
                    style: TextStyle(color: secondTextColor),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/log_page_screen');
                    },
                    child: const Text(
                      'Авторизуйся',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
