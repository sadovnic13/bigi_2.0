part of 'filter_bloc.dart';

class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  FilterLoaded({
    required this.historyRecords,
  });

  final List<HistoryRecord> historyRecords;
}

class FilterFailure extends FilterState {
  FilterFailure({required this.exception});

  final Object? exception;
}
