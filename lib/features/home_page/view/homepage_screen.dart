import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/homepage_block.dart';
import '../home_page.dart';
import '../widgets/widgets.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _homepageBloc = HomepageBloc();
  List<MoneyBill>? _moneyBillsList;
  List<HistoryRecord>? _historyRecords;

  @override
  void initState() {
    _loadData();
    _homepageBloc.add(LoadDataBase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: _moneyBillsList == null && _historyRecords == null
          ? LoadCircular()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15, right: 40, bottom: 10),
                    child: Text(
                      "Счета",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  BillTileList(moneyBillsList: _moneyBillsList!),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15, right: 40, bottom: 10),
                    child: Text(
                      "История",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(cardBorderRadius),
                    ),
                    child: HistoryList(
                      historyRecords: _historyRecords!,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _loadData() async {
    _moneyBillsList = await BillsRepositories().getBillsList();
    _historyRecords = await HistoryRepositories().getHistoryList();
    setState(() {});
  }
}
