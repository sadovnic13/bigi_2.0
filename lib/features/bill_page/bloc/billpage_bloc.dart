import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'billpage_event.dart';
part 'billpage_state.dart';

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
