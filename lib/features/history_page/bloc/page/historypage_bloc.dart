import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repositories/models/models.dart';
import '../../../../repositories/requests/requests.dart';

part 'historypage_event.dart';
part 'historypage_state.dart';

class HistorypageBloc extends Bloc<HistorypageEvent, HistorypageState> {
  HistorypageBloc(this.historyRepository, this.billsRepository) : super(HistorypageInitial()) {
    on<LoadBills>((event, emit) async {
      try {
        emit(HistorypageLoading());
        final moneyBillsList = await billsRepository.getBillsList();
        final historyRecords = await historyRepository.getHistoryList();
        emit(HistorypageLoaded(billsList: moneyBillsList, historyRecords: historyRecords));
      } catch (e) {
        print(e.toString());

        emit(HistorypageFailure(exception: e));
      }
    });
  }

  final BillsRepository billsRepository;
  final HistoryRepository historyRepository;
}
