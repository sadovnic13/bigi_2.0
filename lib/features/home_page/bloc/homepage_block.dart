import 'package:flutter_bloc/flutter_bloc.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<LoadDataBase>((event, emit) {
      print("Data loading...");
    });
  }
}
