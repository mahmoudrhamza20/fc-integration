import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../models/search_model.dart';
import '../../../models/stage_by_id_model.dart';
import '../../../models/stages_model.dart';
import '../../../repos/stages_repo.dart';
part 'stages_state.dart';

class StagesCubit extends Cubit<StagesState> {
  StagesCubit() : super(StagesInitial());

  StagesData? stagesData;
  late List<Stage>? stage = [];
  StageId? stageById;
  List<SearchGroup>? searchGroup = [];
  SearchData? searchData;
  late List<SuggestedGroup>? suggestedGroup = [];

  GetStagesByIdData? stagesByIdData;

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
        //stagesData = res.data;
        stage = res.data.stages;

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
    emit(StagesByIdLoading());
    final res = await getStagesRepo.searchInStage(groupNumber: groupNumber);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(StagesByIdError());
      },
      (res) async {
        showSnackBar(res.message);
        searchGroup = res.data.groups;
        searchData = res.data;
        print(searchGroup);
        emit(StagesByIdLoaded());
      },
    );
  }
}
