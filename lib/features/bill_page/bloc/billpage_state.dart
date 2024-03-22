part of 'billpage_bloc.dart';

abstract class BillpageState extends Equatable {}

class BillpageInitial extends BillpageState {
  @override
  List<Object?> get props => [];
}

class BillpageLoading extends BillpageState {
  @override
  List<Object?> get props => [];
}

class BillpageLoaded extends BillpageState {
  BillpageLoaded({
    required this.bill,
    required this.billHistoryRecords,
  });

  final MoneyBill bill;
  final List<HistoryRecord> billHistoryRecords;

  @override
  List<Object?> get props => [bill, billHistoryRecords];
}

class BillpageFailure extends BillpageState {
  BillpageFailure({
    required this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
