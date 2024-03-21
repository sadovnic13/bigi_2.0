part of 'regpage_bloc.dart';

sealed class RegpageState extends Equatable {
  const RegpageState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegpageState {}

final class RegistrationLoading extends RegpageState {}

final class RegistrationSuccess extends RegpageState {}

final class RegistrationFailure extends RegpageState {
  const RegistrationFailure({required this.exception});

  final Object? exception;
}
