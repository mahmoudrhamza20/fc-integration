part of 'establish_group_cubit.dart';

sealed class EstablishGroupState extends Equatable {
  const EstablishGroupState();

  @override
  List<Object> get props => [];
}

final class EstablishGroupInitial extends EstablishGroupState {}

final class EstablishGroupError extends EstablishGroupState {}

final class EstablishGroupLoading extends EstablishGroupState {}

final class EstablishGroupLoaded extends EstablishGroupState {}
