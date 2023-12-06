import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/magic_router.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../models/join_goup_model.dart';
import '../../../models/search_model.dart';
import '../../../models/stage_by_id_model.dart';
import '../../../models/stages_model.dart';
import '../../../repos/stages_repo.dart';
import '../../../screens/accept_join_to_group.dart';
part 'stages_state.dart';

class StagesCubit extends Cubit<StagesState> {
  StagesCubit() : super(StagesInitial());

  StagesData? stagesData;
  late List<Stage>? stageCurrent = [];
  late List<Stage>? stageNotCurrent = [];

  StageId? stageById;
  List<SearchGroup> searchGroup = [];

  SearchData? searchData;
  late List<SuggestedGroup> suggestedGroup = [];
  GetStagesByIdData? stagesByIdData;

  final codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  JoinGroup? joinGroupData;
  late List<dynamic>? codes;

  final getStagesRepo = GetStagesRepo();
  static StagesCubit of(context) => BlocProvider.of(context);

  Future getStages() async {
    emit(StagesLoading());
    final res = await getStagesRepo.getStages();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(StagesError());
      },
      (res) async {
        showSnackBar(res.message);
        // stage = res.data.stages;
        for (var stage in res.data.stages) {
          if (stage.isCurrent == "1") {
            stageCurrent!.add(stage);
          } else {
            stageNotCurrent!.add(stage);
          }
        }

        emit(StagesLoaded());
      },
    );
  }

  Future getStagesById({required int stageId}) async {
    emit(StagesByIdLoading());
    final res = await getStagesRepo.getStagesById(stageId: stageId);
    res.fold(
      (err) {
        showSnackBar(err);
        print('err');
        print(err);
        print('err');

        emit(StagesByIdError());
      },
      (res) async {
        showSnackBar(res.message);
        stageById = res.data.stage;
        suggestedGroup = res.data.suggestedGroups;
        stagesByIdData = res.data;
        emit(StagesByIdLoaded());
      },
    );
  }

  Future searchInStage({required String groupNumber}) async {
    emit(SearchInStageLoading());
    final res = await getStagesRepo.searchInStage(groupNumber: groupNumber);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(SearchInStageError());
      },
      (res) async {
        showSnackBar(res.message);
        searchGroup = res.data.groups;
        searchData = res.data;
        emit(SearchInStageLoaded());
      },
    );
  }

  Future joinGroup({
    required dynamic groupId,
    required dynamic oldUser,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(JoinGroupLoading());
      final res = await getStagesRepo.joinGroup(
          groupId: groupId, code: codeController.text, oldUser: oldUser);
      res.fold(
        (err) {
          showSnackBar(err);
          emit(JoinGroupError());
        },
        (res) async {
          showSnackBar(res.message);
          codes = res.data.codes;
          joinGroupData = res.data.group;

          MagicRouter.navigateTo(AcceptJoinToGroupScreen(
            joinGroupData: joinGroupData!,
            codes: codes!,
          ));
          emit(JoinGroupeLoaded());
        },
      );
    }
  }
}
