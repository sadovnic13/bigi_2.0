part of 'historypage_bloc.dart';

class HistorypageState {}

class HistorypageInitial extends HistorypageState {}

class HistorypageLoading extends HistorypageState {}

class HistorypageLoaded extends HistorypageState {
  HistorypageLoaded({
    required this.billsList,
    required this.historyRecords,
  });

  final List<MoneyBill> billsList;
  final List<HistoryRecord> historyRecords;
}

class HistorypageFailure extends HistorypageState {
  HistorypageFailure({
    required this.exception,
  });

  final Object? exception;
}

class HistorypageFiltring extends HistorypageState {
  HistorypageFiltring({
    required this.historyRecords,
  });

  final List<HistoryRecord> historyRecords;
}
