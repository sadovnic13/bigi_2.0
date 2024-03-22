import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/repositories.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc(this.historyRepository) : super(FilterInitial()) {
    on<LoadHistoryList>((event, emit) async {
      try {
        emit(FilterLoading());
        final historyRecords = event.selectedItems.isNotEmpty
            ? await historyRepository.getFilteredHistoryList(event.selectedItems)
            : await historyRepository.getHistoryList();
        emit(FilterLoaded(historyRecords: historyRecords));
      } catch (e) {
        print(e);

        emit(FilterFailure(exception: e));
      }
    });
  }

  final HistoryRepository historyRepository;
}
