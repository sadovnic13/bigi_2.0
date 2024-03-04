part of 'billpage_bloc.dart';

class BillpageState {}

class BillpageInitial extends BillpageState {}

class BillpageLoading extends BillpageState {}

class BillpageLoaded extends BillpageState {
  BillpageLoaded({
    required this.bill,
    required this.billHistoryRecords,
  });

  final MoneyBill bill;
  final List<HistoryRecord> billHistoryRecords;
}

class BillpageFailure extends BillpageState {
  BillpageFailure({
    required this.exception,
  });

  final Object? exception;
}
