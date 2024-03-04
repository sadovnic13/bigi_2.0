import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/models/models.dart';
import '../../../repositories/requests/requests.dart';

part 'historypage_event.dart';
part 'historypage_state.dart';

class HistorypageBloc extends Bloc<HistorypageEvent, HistorypageState> {
  HistorypageBloc(this.historyRepository) : super(HistorypageInitial()) {
    on<LoadDataBase>((event, emit) async {
      try {
        emit(HistorypageLoading());
        final historyRecords = await historyRepository.getHistoryList();
        // debugPrint(historyRecords.toString());
        emit(HistorypageLoaded(historyRecords: historyRecords));
      } catch (e) {
        emit(HistorypageFailure(exception: e));
      }
    });
  }

  final HistoryRepository historyRepository;
}
