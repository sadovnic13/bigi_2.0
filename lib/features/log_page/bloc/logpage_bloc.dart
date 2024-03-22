import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../repositories/repositories.dart';
import '../../features.dart';

part 'logpage_event.dart';
part 'logpage_state.dart';

class LogpageBloc extends Bloc<LogpageEvent, LogpageState> {
  LogpageBloc(this.categoryRepository) : super(LoginInitial()) {
    on<SignInUser>((event, emit) async {
      try {
        emit(LoginLoading());
        await Supabase.instance.client.auth.signInWithPassword(email: event.email, password: event.password);
        categoryList = await categoryRepository.getCategoryList();
        debugPrint(categoryList.toString());
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(exception: e));
      }
    });
  }

  final CategoryRepository categoryRepository;
}
