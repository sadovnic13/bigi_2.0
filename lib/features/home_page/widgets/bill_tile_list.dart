import 'package:flutter/material.dart';

import '../../../repositories/repositories.dart';
import 'bill_card.dart';

class BillTileList extends StatelessWidget {
  BillTileList({super.key, required this.moneyBillsList});
  final List<MoneyBill> moneyBillsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: moneyBillsList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return BillCard(
            bill: moneyBillsList[index],
          );
        },
      ),
    );
  }
}
