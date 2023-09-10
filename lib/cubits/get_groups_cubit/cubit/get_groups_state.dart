part of 'get_groups_cubit.dart';

sealed class GetGroupsState extends Equatable {
  const GetGroupsState();

  @override
  List<Object> get props => [];
}

final class GetGroupsInitial extends GetGroupsState {}

final class GetGroupsErrors extends GetGroupsState {}

final class GetGroupsLoading extends GetGroupsState {}

final class GetGroupsLoaded extends GetGroupsState {}
