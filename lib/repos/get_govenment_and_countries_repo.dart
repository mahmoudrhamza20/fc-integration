// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/error_model.dart';
import 'package:shared/models/get_cities_model.dart';
import 'package:shared/models/get_countries_model.dart';
import 'package:shared/models/get_government_model.dart';

class GetGovernmentsAndCountriesRepo {
  Future<Either<String, GetGovernmentModel>> getGovernments(
      {required int countryId}) async {
    final response = await DioHelper.get(
        EndPoints.governments(countryId: countryId),
        headers: {
          'Accept-Language': 'ar',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppStorage.getToken}'
        });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success GetGovernments");
        print(response.data);
        return Right(
            GetGovernmentModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetCountriesModel>> getCountries() async {
    final response = await DioHelper.get(EndPoints.countries, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success GetCountries");
        print(response.data);
        return Right(
            GetCountriesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetCitiesModel>> getCities(
      {required int governmentId}) async {
    final response = await DioHelper.get(
        EndPoints.cities(governmentId: governmentId),
        headers: {
          'Accept-Language': 'ar',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppStorage.getToken}'
        });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success GetCities");
        print(response.data);
        return Right(GetCitiesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
