import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';

class BillPageScreen extends StatefulWidget {
  const BillPageScreen({super.key});

  @override
  State<BillPageScreen> createState() => _BillPageScreenState();
}

class _BillPageScreenState extends State<BillPageScreen> {
  MoneyBill? bill;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null, "Route args error");
    bill = args as MoneyBill;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: mainTextColor),
        title: Text(
          bill!.name,
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Container(),
    );
  }
}
