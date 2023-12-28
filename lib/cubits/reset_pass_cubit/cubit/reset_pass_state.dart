part of 'reset_pass_cubit.dart';

sealed class ResetPassState extends Equatable {
  const ResetPassState();

  @override
  List<Object> get props => [];
}

final class ResetPassInitial extends ResetPassState {}

final class ResetPassLoading extends ResetPassState {}

final class ResetPassError extends ResetPassState {}

final class ResetPassLoaded extends ResetPassState {}
