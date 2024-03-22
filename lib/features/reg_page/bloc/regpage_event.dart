part of 'regpage_bloc.dart';

abstract class RegpageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpUser extends RegpageEvent {
  SignUpUser({
    required this.email,
    required this.password,
    required this.repeatedPassword,
  });

  final String email;
  final String password;
  final String repeatedPassword;
}
