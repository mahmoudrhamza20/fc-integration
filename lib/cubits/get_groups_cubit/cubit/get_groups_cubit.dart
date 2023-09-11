import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/widgets/custom_snackbar.dart';
import 'package:shared/models/group_by_id_model.dart';

import '../../../models/get_groubs_model.dart';
import '../../../repos/get_groups_repo.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit() : super(GetGroupsInitial());

  final getGroupsRepo = GetGroupsRepo();
  late List<Group>? groupData = [];
  String? searchKeywordsData2;
  late GroupById? groupById;
  static GetGroupsCubit of(context) => BlocProvider.of(context);

  Future getGroups() async {
    emit(GetGroupsLoading());
    final res = await getGroupsRepo.getGroups();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(GetGroupsErrors());
      },
      (res) async {
        // showSnackBar(res.message);
        groupData = res.data.groups;

        emit(GetGroupsLoaded());
      },
    );
  }

  Future getGroupsById({required int groubId}) async {
    emit(GetGroupsIdLoading());
    final res = await getGroupsRepo.getGroupsById(groubId: groubId);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(GetGroupsIdErrors());
      },
      (res) async {
        showSnackBar(res.message);
        groupById = res.data.group;
        emit(GetGroupsIdLoaded());
      },
    );
  }

  Future searchKeywords() async {
    emit(SearchKeywordsLoading());
    final res = await getGroupsRepo.searchKeywords();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchKeywordsErrors());
      },
      (res) async {
        showSnackBar(res.message);
        searchKeywordsData2 = res.data.groups[0];
        print(searchKeywordsData2);
        emit(SearchKeywordsLoaded());
      },
    );
  }
}
