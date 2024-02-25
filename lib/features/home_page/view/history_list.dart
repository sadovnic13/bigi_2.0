import 'package:flutter/material.dart';

import '../../../repositories/repositories.dart';
import '../../widgets_common/widgets_common.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.historyRecords});
  final List<HistoryRecord> historyRecords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
        3,
        (index) {
          return SpendRow(
            record: historyRecords[index],
          );
        },
      ),
    );
  }
}
