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

final class CheckPhoneLoading extends LoginState {}

final class CheckPhoneError extends LoginState {}

final class CheckPhoneLoaded extends LoginState {}

final class CheckOtpLoading extends LoginState {}

final class CheckOtpError extends LoginState {}

final class CheckOtpLoaded extends LoginState {}
