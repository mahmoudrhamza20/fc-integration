import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../models/stages_model.dart';
import '../../../repos/stages_repo.dart';
part 'stages_state.dart';

class StagesCubit extends Cubit<StagesState> {
  StagesCubit() : super(StagesInitial());

  late StagesData? stagesData;

  final getStagesRepo = GetStagesRepo();

  static StagesCubit of(context) => StagesCubit.of(context);

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
        stagesData = res.data;

        emit(StagesLoaded());
      },
    );
  }
}
