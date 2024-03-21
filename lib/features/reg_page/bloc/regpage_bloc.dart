import 'package:bigi/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

part 'regpage_event.dart';
part 'regpage_state.dart';

class RegpageBloc extends Bloc<RegpageEvent, RegpageState> {
  RegpageBloc(this.categoryRepository) : super(RegistrationInitial()) {
    on<SignUpUser>((event, emit) async {
      try {
        emit(RegistrationLoading());
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(event.email)) {
          throw Exception("Неверный формат почты");
        }
        if (!RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(event.password)) {
          throw Exception("Неверный формат пароля");
        }
        if (event.password != event.repeatedPassword) throw Exception("Пароли не совпадают");

        await Supabase.instance.client.auth.signUp(email: event.email, password: event.password);
        await categoryRepository.defaultCategoryCreation();
        emit(RegistrationSuccess());
        // print('Пользователь успешно зарегистрирован');
        // Navigator.pushNamedAndRemoveUntil(
        //   context,
        //   '/home_page_screen',
        //   (route) => false,
        // );
      } catch (e) {
        // // String error = e;
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(e.toString()),
        //   ),
        // );
        emit(RegistrationFailure(exception: e));
      }
    });
  }

  final CategoryRepository categoryRepository;
}
