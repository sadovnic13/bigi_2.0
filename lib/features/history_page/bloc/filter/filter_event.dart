part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {}

class LoadHistoryList extends FilterEvent {
  LoadHistoryList({required this.selectedItems});

  final List<int> selectedItems;

  @override
  List<Object?> get props => [selectedItems];
}
