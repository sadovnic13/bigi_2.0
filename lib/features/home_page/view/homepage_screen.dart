import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/homepage_block.dart';
import '../home_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _homepageBloc = HomepageBloc(BillsRepository(), HistoryRepository());

  @override
  void initState() {
    _homepageBloc.add(LoadDataBase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная',
        ),
      ),
      drawer: const SideMenu(),
      floatingActionButton: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: _homepageBloc,
        builder: (context, state) {
          return state is HomepageLoaded ? const AddButton() : const SizedBox();
        },
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: _homepageBloc,
        builder: (context, state) {
          if (state is HomepageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                _homepageBloc.add(LoadDataBase());
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15, top: 0, right: 40, bottom: 10),
                    //   child: Text(
                    //     "Счета",
                    //     style: theme.textTheme.labelMedium,
                    //   ),
                    // ),
                    state.billsList.isEmpty
                        ? Container(
                            height: 100,
                            width: 40,
                            color: successColor,
                          )
                        : BillTileList(moneyBillsList: state.billsList),

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
                      child: state.historyRecords.isNotEmpty
                          ? HistoryList(historyRecords: state.historyRecords)
                          : const EmptyHistory(),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is HomepageFailure) {
            return FailureMessage(userClick: () {
              _homepageBloc.add(LoadDataBase());
            });
          }

          return const LoadCircular();
        },
      ),
    );
  }
}
