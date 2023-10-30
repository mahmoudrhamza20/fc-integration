import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/models/get_countries_model.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../models/get_cities_model.dart';
import '../../../models/get_government_model.dart';
import '../../../repos/get_govenment_and_countries_repo.dart';
part 'getgovernmentsandcountries_state.dart';

class GetGovernmentsAndCountriesCubit
    extends Cubit<GetGovernmentsAndCountriesState> {
  GetGovernmentsAndCountriesCubit()
      : super(GetgovernmentsandcountriesInitial());

  final getGovernmentsAndCountriesRepo = GetGovernmentsAndCountriesRepo();
  List<Governorate> governmentData = [];
  List<Country> countriesData = [];
  List<City> cityData = [];

  static GetGovernmentsAndCountriesCubit of(context) =>
      BlocProvider.of(context);

  Future getCountries() async {
    emit(GetgovernmentsandcountriesLoading());
    final res = await getGovernmentsAndCountriesRepo.getCountries();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(GetgovernmentsandcountriesError());
      },
      (res) async {
        // showSnackBar(res.message);
        countriesData = res.data.countries!;
        emit(GetgovernmentsandcountriesLoaded());
      },
    );
  }

  Future getGovernments({int countryId = 1}) async {
    emit(GetgovernmentsandcountriesLoading());
    final res = await getGovernmentsAndCountriesRepo.getGovernments(
        countryId: countryId);
    res.fold(
      (err) {
        showSnackBar(err);
        emit(GetgovernmentsandcountriesError());
      },
      (res) async {
        // showSnackBar(res.message);
        governmentData = res.data.governorates;
        emit(GetgovernmentsandcountriesLoaded());
      },
    );
  }

  Future getCities({int governmentId = 2}) async {
    emit(GetgovernmentsandcountriesLoading());
    final res = await getGovernmentsAndCountriesRepo.getCities(
        governmentId: governmentId);
    res.fold(
      (err) {
        showSnackBar(err);
        print(err);
        emit(GetgovernmentsandcountriesError());
      },
      (res) async {
        // showSnackBar(res.message);
        cityData = res.data.cities;
        emit(GetgovernmentsandcountriesLoaded());
      },
    );
  }
}
