part of 'homepage_block.dart';

abstract class HomepageState extends Equatable {}

class HomepageInitial extends HomepageState {
  @override
  List<Object?> get props => [];
}

class HomepageLoading extends HomepageState {
  @override
  List<Object?> get props => [];
}

class HomepageLoaded extends HomepageState {
  HomepageLoaded({
    required this.billsList,
    required this.historyRecords,
  });

  final List<MoneyBill> billsList;
  final List<HistoryRecord> historyRecords;

  @override
  List<Object?> get props => [billsList, historyRecords];
}

class HomepageFailure extends HomepageState {
  HomepageFailure({
    required this.exception,
  });
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
