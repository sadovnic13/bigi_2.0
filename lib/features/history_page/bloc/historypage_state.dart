part of 'historypage_bloc.dart';

class HistorypageState {}

class HistorypageInitial extends HistorypageState {}

class HistorypageLoading extends HistorypageState {}

class HistorypageLoaded extends HistorypageState {
  HistorypageLoaded({
    required this.historyRecords,
  });

  final List<HistoryRecord> historyRecords;
}

class HistorypageFailure extends HistorypageState {
  HistorypageFailure({
    required this.exception,
  });

  final Object? exception;
}
