import 'package:flutter/material.dart';

import '../../design/design.dart';

class FloatingButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const FloatingButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: floatingColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize20,
            ),
          ),
        ),
      ),
    );
  }
}
