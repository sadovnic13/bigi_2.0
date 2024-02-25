import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';

class BillCard extends StatelessWidget {
  const BillCard({super.key, required this.bill});
  final MoneyBill bill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(cardBorderRadius),
      onTap: () {
        Navigator.pushNamed(context, '/bill_page_screen', arguments: bill);
      },
      child: Ink(
        padding: const EdgeInsets.all(10),
        width: 175,
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(cardBorderRadius),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bill.name,
                style: theme.textTheme.titleSmall,
                textAlign: TextAlign.left,
              ),
              Text(
                '${bill.balance.toStringAsFixed(2)} BYN',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall,
                textAlign: TextAlign.left,
              )
            ]),
      ),
    );
  }
}
