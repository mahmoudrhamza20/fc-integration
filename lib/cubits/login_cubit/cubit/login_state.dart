part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {}

final class LoginLoaded extends LoginState {}

final class LogoutLoading extends LoginState {}

final class LogoutError extends LoginState {}

final class LogoutLoaded extends LoginState {}
