import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../theme/theme.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: const Text(
          "История пуста",
          style: TextStyle(
              fontFamily: fontFamilyMontserrat,
              fontSize: fontSize20,
              color: mainTextColor,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
