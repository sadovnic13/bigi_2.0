import 'package:bigi/design/colors.dart';
import 'package:flutter/material.dart';

class DataTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const DataTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: mainTextColor,
        style: theme.textTheme.titleMedium,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: mainTextColor)),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: mainTextColor)),
          label: Text(hintText),
          labelStyle: theme.textTheme.titleSmall!.copyWith(color: secondTextColor),
        ),
      ),
    );
  }
}
