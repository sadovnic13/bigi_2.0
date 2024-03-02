import 'package:bigi/features/bill_page/bloc/billpage_event.dart';
import 'package:bigi/features/bill_page/bloc/billpage_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/requests/requests.dart';

class BillpageBloc extends Bloc<BillpageEvent, BillpageState> {
  BillpageBloc(this.billsRepository, this.historyRepository, this.billId) : super(BillpageInitial()) {
    on<LoadBillData>((event, emit) async {
      try {
        emit(BillpageLoading());
        final moneyBill = await billsRepository.getBill(billId);
        final historyRecords = await historyRepository.getBillHistory(billId);
        emit(BillpageLoaded(bill: moneyBill, billHistoryRecords: historyRecords));
      } catch (e) {
        emit(BillpageFailure(exception: e));
      }
    });
  }

  final int billId;
  final BillsRepository billsRepository;
  final HistoryRepository historyRepository;
}
