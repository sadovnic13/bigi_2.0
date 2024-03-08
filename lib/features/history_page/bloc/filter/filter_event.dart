part of 'filter_bloc.dart';

class FilterEvent {}

class LoadHistoryList extends FilterEvent {
  LoadHistoryList({required this.selectedItems});

  final List<int> selectedItems;
}
