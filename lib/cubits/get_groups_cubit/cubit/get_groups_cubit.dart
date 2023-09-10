import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/widgets/custom_snackbar.dart';
import 'package:shared/repos/get_groups_repo.dart';

import '../../../models/get_groubs_model.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  GetGroupsCubit() : super(GetGroupsInitial());

  final getGroupsRepo = GetGroupsRepo();

  GroupData? groupData;
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
        showSnackBar(res.message);
        groupData = res.data;

        emit(GetGroupsLoaded());
      },
    );
  }
}
