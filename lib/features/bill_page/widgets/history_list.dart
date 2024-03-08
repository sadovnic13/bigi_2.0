import 'dart:math';

import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../../theme/theme.dart';
import '../../widgets_common/widgets_common.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
    required this.historyRecords,
    required this.billId,
  });
  final List<HistoryRecord> historyRecords;
  final int billId;

  @override
  Widget build(BuildContext context) {
    int countRow = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...List<Widget>.generate(
          min(countRow, historyRecords.length),
          (index) {
            return SpendRow(
              record: historyRecords[index],
            );
          },
        ),
        historyRecords.length > countRow
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                height: 40,
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/history_page_screen",
                      (Route<dynamic> route) => false,
                      arguments: [billId],
                    );
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
      ],
    );
  }
}
