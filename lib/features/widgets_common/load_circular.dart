import 'package:flutter/material.dart';

import '../../design/design.dart';

class LoadCircular extends StatefulWidget {
  const LoadCircular({super.key, this.color});
  final Color? color;

  @override
  State<LoadCircular> createState() => _LoadCircularState();
}

class _LoadCircularState extends State<LoadCircular> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.color ?? mainTextColor),
      ),
    );
  }
}
