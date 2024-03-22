part of 'historypage_bloc.dart';

abstract class HistorypageState extends Equatable {}

class HistorypageInitial extends HistorypageState {
  @override
  List<Object?> get props => [];
}

class HistorypageLoading extends HistorypageState {
  @override
  List<Object?> get props => [];
}

class HistorypageLoaded extends HistorypageState {
  HistorypageLoaded({
    required this.billsList,
    required this.historyRecords,
  });

  final List<MoneyBill> billsList;
  final List<HistoryRecord> historyRecords;

  @override
  List<Object?> get props => [billsList, historyRecords];
}

class HistorypageFailure extends HistorypageState {
  HistorypageFailure({
    required this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
