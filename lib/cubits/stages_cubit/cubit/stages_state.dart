part of 'stages_cubit.dart';

sealed class StagesState extends Equatable {
  const StagesState();

  @override
  List<Object> get props => [];
}

final class StagesInitial extends StagesState {}

final class StagesError extends StagesState {}

final class StagesLoading extends StagesState {}

final class StagesLoaded extends StagesState {}
