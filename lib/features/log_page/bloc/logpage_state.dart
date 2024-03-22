part of 'logpage_bloc.dart';

abstract class LogpageState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LogpageState {}

class LoginLoading extends LogpageState {}

class LoginSuccess extends LogpageState {}

class LoginFailure extends LogpageState {
  LoginFailure({required this.exception});

  final Object? exception;
}
