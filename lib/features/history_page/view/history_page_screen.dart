import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../../../theme/theme.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';

class HistoryPageScreen extends StatefulWidget {
  const HistoryPageScreen({super.key});

  @override
  State<HistoryPageScreen> createState() => _HistoryPageScreenState();
}

class _HistoryPageScreenState extends State<HistoryPageScreen> {
  final _historypageBloc = HistorypageBloc(HistoryRepository(), BillsRepository());
  final _filterBloc = FilterBloc(HistoryRepository());

  List<int> selectedItems = [];

  @override
  void initState() {
    _historypageBloc.add(LoadBills());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedItems = ModalRoute.of(context)?.settings.arguments as List<int> ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.of(context).pushReplacementNamed('/');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'История  ',
          ),
        ),
        drawer: const SideMenu(),
        body: BlocBuilder<HistorypageBloc, HistorypageState>(
          bloc: _historypageBloc,
          builder: (context, state) {
            if (state is HistorypageLoaded) {
              _filterBloc.add(LoadHistoryList(selectedItems: selectedItems));

              Map<String, List<HistoryRecord>> groupByDate = groupBy(state.historyRecords, (obj) => obj.date);
              return RefreshIndicator(
                onRefresh: () async {
                  _historypageBloc.add(LoadBills());
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: state.billsList.map((MoneyBill item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: BillChip(
                              selectedItems: selectedItems,
                              item: item,
                              filterBloc: _filterBloc,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<FilterBloc, FilterState>(
                        bloc: _filterBloc,
                        builder: (context, state) {
                          if (state is FilterLoaded) {
                            if (state.historyRecords.isEmpty) return const EmptyHistory();
                            groupByDate = groupBy(state.historyRecords, (obj) => obj.date);
                            List<Widget> widgets = [];
                            List<String> months = [
                              'января',
                              'февраля',
                              'марта',
                              'апреля',
                              'мая',
                              'июня',
                              'июля',
                              'августа',
                              'сентября',
                              'октября',
                              'ноября',
                              'декабря'
                            ];

                            groupByDate.forEach((date, list) {
                              List<String> dateParts = [];
                              if (date == DateTime.now().toIso8601String().substring(0, 10)) {
                                dateParts.add('Сегодня');
                              } else {
                                dateParts = date.split('-');
                                dateParts[2] = int.parse(dateParts[2]).toString();
                                dateParts[1] = months[int.parse(dateParts[1]) - 1];
                              }
                              // Header
                              widgets.add(
                                Container(
                                  child: Text(
                                    dateParts.reversed.join(' '),
                                    style: const TextStyle(
                                      fontFamily: fontFamilyMontserrat,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      color: mainTextColor,
                                    ),
                                  ),
                                ),
                              );
                              widgets.add(const Divider(
                                color: mainTextColor,
                              ));
                              // Group
                              for (var listItem in list) {
                                widgets.add(SpendRow(record: listItem));
                              }
                            });
                            return ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              children: widgets,
                            );
                          }

                          if (state is FilterFailure) {
                            return FailureMessage(userClick: () {
                              _filterBloc.add(LoadHistoryList(selectedItems: selectedItems));
                            });
                          }

                          return const LoadCircular();
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is HistorypageFailure) {
              return FailureMessage(userClick: () {
                _historypageBloc.add(LoadBills());
              });
            }

            return const LoadCircular();
          },
        ),
      ),
    );
  }
}
