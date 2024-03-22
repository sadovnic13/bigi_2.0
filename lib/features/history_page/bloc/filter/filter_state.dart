part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {}

class FilterInitial extends FilterState {
  @override
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {
  @override
  List<Object?> get props => [];
}

class FilterLoaded extends FilterState {
  FilterLoaded({
    required this.historyRecords,
  });

  final List<HistoryRecord> historyRecords;

  @override
  List<Object?> get props => [historyRecords];
}

class FilterFailure extends FilterState {
  FilterFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
