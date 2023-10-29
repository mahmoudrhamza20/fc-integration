part of 'getgovernmentsandcountries_cubit.dart';

abstract class GetGovernmentsAndCountriesState extends Equatable {
  const GetGovernmentsAndCountriesState();

  @override
  List<Object> get props => [];
}

final class GetgovernmentsandcountriesInitial
    extends GetGovernmentsAndCountriesState {}

final class GetgovernmentsandcountriesError
    extends GetGovernmentsAndCountriesState {}

final class GetgovernmentsandcountriesLoading
    extends GetGovernmentsAndCountriesState {}

final class GetgovernmentsandcountriesLoaded
    extends GetGovernmentsAndCountriesState {}
