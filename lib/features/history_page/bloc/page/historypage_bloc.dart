import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/models/models.dart';
import '../../../../repositories/requests/requests.dart';

part 'historypage_event.dart';
part 'historypage_state.dart';

class HistorypageBloc extends Bloc<HistorypageEvent, HistorypageState> {
  HistorypageBloc(this.historyRepository, this.billsRepository) : super(HistorypageInitial()) {
    on<LoadDataBase>((event, emit) async {
      try {
        emit(HistorypageLoading());
        final moneyBillsList = await billsRepository.getBillsList();
        final historyRecords = await historyRepository.getHistoryList();
        // debugPrint(historyRecords.toString());
        emit(HistorypageLoaded(billsList: moneyBillsList, historyRecords: historyRecords));
      } catch (e) {
        emit(HistorypageFailure(exception: e));
      }
    });

    on<FilterDataBase>((event, emit) async {
      // emit(HistorypageLoading());
      // debugPrint("Filtring...");
      final historyRecords = await historyRepository.getHistoryList();
      // emit(HistorypageFiltring(historyRecords: historyRecords));
    });
  }

  final BillsRepository billsRepository;
  final HistoryRepository historyRepository;
}
