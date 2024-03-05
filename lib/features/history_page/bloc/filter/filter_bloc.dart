import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<SortHistoryList>((event, emit) {
      debugPrint("Filtring...");
    });
  }
}
