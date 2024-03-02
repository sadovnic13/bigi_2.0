import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../theme/theme.dart';

class FailureMessage extends StatelessWidget {
  const FailureMessage({super.key, required this.userClick});
  final Function userClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Что-то пошло не так",
            style: theme.textTheme.titleMedium,
          ),
          const Text(
            'Попробуйте позже',
            style: TextStyle(
                fontFamily: fontFamilyMontserrat,
                fontSize: fontSize15,
                color: secondTextColor,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: () {
              userClick();
              // _billpageBloc.add(LoadBillData());
            },
            child: Text(
              'Повторить',
              style: theme.textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
