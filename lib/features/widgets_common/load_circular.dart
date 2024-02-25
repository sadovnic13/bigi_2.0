import 'package:flutter/material.dart';

import '../../design/design.dart';

class LoadCircular extends StatefulWidget {
  const LoadCircular({super.key});

  @override
  State<LoadCircular> createState() => _LoadCircularState();
}

class _LoadCircularState extends State<LoadCircular> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(mainTextColor),
      ),
    );
  }
}
