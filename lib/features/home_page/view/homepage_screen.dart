import 'package:flutter/material.dart';

import '../../../design/design.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    int billId = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/bill_page_screen', arguments: billId);
        },
        child: Text(billId.toString()),
      )),
    );
  }
}
