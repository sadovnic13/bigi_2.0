part of 'regpage_bloc.dart';

abstract class RegpageEvent extends Equatable {}

class SignUpUser extends RegpageEvent {
  SignUpUser({
    required this.email,
    required this.password,
    required this.repeatedPassword,
  });

  final String email;
  final String password;
  final String repeatedPassword;

  @override
  List<Object?> get props => [email, password, repeatedPassword];
}
