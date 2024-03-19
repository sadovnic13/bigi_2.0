import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logpage_event.dart';
part 'logpage_state.dart';

class LogpageBloc extends Bloc<LogpageEvent, LogpageState> {
  LogpageBloc() : super(LogpageInitial()) {
    on<LogpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
