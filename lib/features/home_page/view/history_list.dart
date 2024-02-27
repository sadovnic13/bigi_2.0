import 'dart:math';

import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../../theme/theme.dart';
import '../../widgets_common/widgets_common.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.historyRecords});
  final List<HistoryRecord> historyRecords;

  @override
  Widget build(BuildContext context) {
    int countRow = 3;
    return Column(children: [
      ...List<Widget>.generate(
        min(countRow, historyRecords.length),
        (index) {
          return SpendRow(
            record: historyRecords[index],
          );
        },
      ),
      historyRecords.length > countRow
          ? SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  debugPrint("More button press...");
                },
                child: const Text(
                  'Ещё',
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: fontSize15,
                    fontFamily: fontFamilyMontserrat,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ]);
  }
}
