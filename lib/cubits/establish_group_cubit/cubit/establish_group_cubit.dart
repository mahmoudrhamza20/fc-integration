import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/magic_router.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../repos/establish_group_repo.dart';
import '../../../screens/add_request_to_create_group.dart';
part 'establish_group_state.dart';

class EstablishGroupCubit extends Cubit<EstablishGroupState> {
  EstablishGroupCubit() : super(EstablishGroupInitial());
  static EstablishGroupCubit of(context) => BlocProvider.of(context);
  final establishGroupRepo = EstablishGroupRepo();

  Future establishGroup({required int stageId}) async {
    emit(EstablishGroupLoading());
    final res = await establishGroupRepo.establishGroup(stageId: stageId);
    res.fold(
      (err) {
        showSnackBar(err);
        print(err);
        emit(EstablishGroupError());
      },
      (res) async {
        showSnackBar(res.message);
        MagicRouter.navigateAndPopUntilFirstPage(const AfterAddRequest());
        emit(EstablishGroupLoaded());
      },
    );
  }
}
