import 'package:bigi/design/colors.dart';
import 'package:bigi/repositories/repositories.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/theme.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/historypage_bloc.dart';

class HistoryPageScreen extends StatefulWidget {
  const HistoryPageScreen({super.key});

  @override
  State<HistoryPageScreen> createState() => _HistoryPageScreenState();
}

class _HistoryPageScreenState extends State<HistoryPageScreen> {
  final _historypageBloc = HistorypageBloc(HistoryRepository());

  @override
  void initState() {
    _historypageBloc.add(LoadDataBase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
            Map<String, List<HistoryRecord>> groupByDate = groupBy(state.historyRecords, (obj) => obj.date);

            List<Widget> widgets = [];
            List<String> months = [
              'январь',
              'февраль',
              'март',
              'апрель',
              'май',
              'июнь',
              'июль',
              'август',
              'сентябрь',
              'октябрь',
              'ноябрь',
              'декабрь'
            ];

            groupByDate.forEach((date, list) {
              List<String> dateParts = date.split('-');
              dateParts[1] = months[int.parse(dateParts[1]) - 1];
              // Header
              widgets.add(
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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

          if (state is HistorypageFailure) {
            return FailureMessage(userClick: () {
              _historypageBloc.add(LoadDataBase());
            });
          }

          return const LoadCircular();
        },
      ),
    );
  }
}
