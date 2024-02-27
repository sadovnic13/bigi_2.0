import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../../theme/theme.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/homepage_block.dart';
import '../home_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // List<MoneyBill>? _moneyBillsList;
  // List<HistoryRecord>? _historyRecords;
  final _homepageBloc = HomepageBloc(BillsRepository(), HistoryRepository());

  @override
  void initState() {
    // _loadData();
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
        body: BlocBuilder<HomepageBloc, HomepageState>(
          bloc: _homepageBloc,
          builder: (context, state) {
            if (state is HomepageLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  _homepageBloc.add(LoadDataBase());
                },
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 15, right: 40, bottom: 10),
                          child: Text(
                            "Счета",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        BillTileList(moneyBillsList: state.billsList),
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
                            historyRecords: state.historyRecords,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            if (state is HomepageFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ЧТо-то пошло не так",
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
                    SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _homepageBloc.add(LoadDataBase());
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
            return const LoadCircular();
          },
        )

        //  _moneyBillsList == null && _historyRecords == null
        //     ? LoadCircular()
        //     : SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.only(left: 25, top: 15, right: 40, bottom: 10),
        //               child: Text(
        //                 "Счета",
        //                 style: theme.textTheme.titleMedium,
        //               ),
        //             ),
        //             BillTileList(moneyBillsList: _moneyBillsList!),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 25, top: 15, right: 40, bottom: 10),
        //               child: Text(
        //                 "История",
        //                 style: theme.textTheme.titleMedium,
        //               ),
        //             ),
        //             Container(
        //               margin: const EdgeInsets.symmetric(horizontal: 15),
        //               padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
        //               decoration: BoxDecoration(
        //                 color: surfaceColor,
        //                 borderRadius: BorderRadius.circular(cardBorderRadius),
        //               ),
        //               child: HistoryList(
        //                 historyRecords: _historyRecords!,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        );
  }

  Future<void> _loadData() async {
    // _moneyBillsList = await BillsRepository().getBillsList();
    // _historyRecords = await HistoryRepository().getHistoryList();
    setState(() {});
  }
}
