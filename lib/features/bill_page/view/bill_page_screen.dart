import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../widgets_common/widgets_common.dart';
import '../bill_page.dart';
import '../bloc/billpage_bloc.dart';

class BillPageScreen extends StatefulWidget {
  const BillPageScreen({super.key});

  @override
  State<BillPageScreen> createState() => _BillPageScreenState();
}

class _BillPageScreenState extends State<BillPageScreen> {
  MoneyBill? bill;
  late final BillpageBloc _billpageBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null, "Route args error");
    bill = args as MoneyBill;
    _billpageBloc = BillpageBloc(BillsRepository(), HistoryRepository(), bill!.id);
    _billpageBloc.add(LoadBillData());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: mainTextColor),
        title: Text(
          bill!.name,
        ),
      ),
      body: BlocBuilder<BillpageBloc, BillpageState>(
        bloc: _billpageBloc,
        builder: (context, state) {
          if (state is BillpageLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Center(
                    child: Text('${state.bill.balance.toString()} BYN', style: theme.textTheme.titleLarge),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 40, bottom: 5),
                  child: Text(
                    "Сегодня",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1, color: mainTextColor),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                  child: state.billHistoryRecords.isNotEmpty
                      ? HistoryList(historyRecords: state.billHistoryRecords)
                      : EmptyHistory(),
                ),
              ],
            );
          }
          if (state is BillpageFailure) {
            return FailureMessage(userClick: () {
              _billpageBloc.add(LoadBillData());
            });
          }
          return const LoadCircular();
        },
      ),
    );
  }
}
