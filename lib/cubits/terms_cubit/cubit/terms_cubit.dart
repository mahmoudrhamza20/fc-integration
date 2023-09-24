import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/widgets/custom_snackbar.dart';
import 'package:shared/models/terms_model.dart';
import 'package:shared/repos/terms_repo.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());

  final termsRepo = TermsRepo();

  TermsData? termsData;
  static TermsCubit of(context) => BlocProvider.of(context);

  Future getTerms() async {
    emit(TermsLoading());
    final res = await termsRepo.terms();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(TermsError());
      },
      (res) async {
        showSnackBar(res.message);
        termsData = res.data;

        emit(TermsLoaded());
      },
    );
  }
}
