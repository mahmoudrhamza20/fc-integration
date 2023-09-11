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

final class GetGroupsIdErrors extends GetGroupsState {}

final class GetGroupsIdLoading extends GetGroupsState {}

final class GetGroupsIdLoaded extends GetGroupsState {}

final class SearchKeywordsErrors extends GetGroupsState {}

final class SearchKeywordsLoading extends GetGroupsState {}

final class SearchKeywordsLoaded extends GetGroupsState {}
