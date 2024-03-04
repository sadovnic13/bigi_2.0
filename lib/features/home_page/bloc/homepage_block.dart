import 'package:bigi/repositories/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/requests/requests.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(this.billsRepository, this.historyRepository) : super(HomepageInitial()) {
    on<LoadDataBase>((event, emit) async {
      try {
        emit(HomepageLoading());
        final moneyBillsList = await billsRepository.getBillsList();
        final historyRecords = await historyRepository.getTodayHistory();
        emit(HomepageLoaded(billsList: moneyBillsList, historyRecords: historyRecords));
      } catch (e) {
        emit(HomepageFailure(exception: e));
      }
    });
  }

  final BillsRepository billsRepository;
  final HistoryRepository historyRepository;
}
