part of 'logpage_bloc.dart';

sealed class LogpageState extends Equatable {
  const LogpageState();

  @override
  List<Object> get props => [];
}

final class LogpageInitial extends LogpageState {}

final class LogpageLoading extends LogpageState {}

final class LogpageLoaded extends LogpageState {}

final class LogpageFailure extends LogpageState {}
