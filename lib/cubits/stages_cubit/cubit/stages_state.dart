part of 'stages_cubit.dart';

abstract class StagesState extends Equatable {
  const StagesState();

  @override
  List<Object> get props => [];
}

final class StagesInitial extends StagesState {}

final class StagesError extends StagesState {}

final class StagesLoading extends StagesState {}

final class StagesLoaded extends StagesState {}

final class StagesByIdError extends StagesState {}

final class StagesByIdLoading extends StagesState {}

final class StagesByIdLoaded extends StagesState {}

final class JoinGroupError extends StagesState {}

final class JoinGroupLoading extends StagesState {}

final class JoinGroupeLoaded extends StagesState {}
