import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../repositories/repositories.dart';
import '../../theme/theme.dart';

class SpendRow extends StatelessWidget {
  const SpendRow({super.key, required this.record});
  final HistoryRecord record;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  height: litleiconsize,
                  width: litleiconsize,
                  child: moneys,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        record.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        record.billName.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: fontFamilyMontserrat,
                            fontSize: fontSize15,
                            color: secondTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      record.isProfit
                          ? '+${record.money.toStringAsFixed(2)} BYN'
                          : '-${record.money.toStringAsFixed(2)} BYN',
                      style: TextStyle(
                        fontFamily: fontFamilyMontserrat,
                        fontSize: fontSize15,
                        color: record.isProfit ? successColor : failColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Text(
                    //   record.date.split('-').reversed.join('.'),
                    //   style: const TextStyle(
                    //       fontFamily: fontFamilyMontserrat,
                    //       fontSize: fontSize15,
                    //       color: secondTextColor,
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 15),
          //   decoration: BoxDecoration(
          //     color: backgroundColor,
          //     borderRadius: BorderRadius.circular(cardBorderRadius),
          //   ),
          //   height: 2,
          // ),
        ],
      ),
    );
  }

  // Widget _title() {
  //   return
  // }

  // Widget _state() {
  //   return
  // }
}
