// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/error_model.dart';
import 'package:shared/models/stages_model.dart';

class GetStagesRepo {
  Future<Either<String, StagesModel>> getStages() async {
    final response = await DioHelper.get(EndPoints.stages, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success GetStagesRepo");
        print(response.data);
        return Right(StagesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Future<Either<String, GetGroupsByIdModel>> getStagesById(
  //     {required int groubId}) async {
  //   final response =
  //       await DioHelper.get(EndPoints.groupById(id: groubId), headers: {
  //     'Accept-Language': 'ar',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${AppStorage.getToken}'
  //   });

  //   try {
  //     if (response.statusCode == 200 && response.data['result'] == true) {
  //       print("Success getGroupsById");
  //       print(response.data);
  //       return Right(
  //           GetGroupsByIdModel.fromJson(jsonDecode(response.toString())));
  //     } else {
  //       return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
  //           .message
  //           .toString());
  //     }
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }
}
