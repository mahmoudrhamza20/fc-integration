// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/error_model.dart';
import 'package:shared/models/search_error_model.dart';
import 'package:shared/models/search_model.dart';
import 'package:shared/models/stage_by_id_model.dart';
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

  Future<Either<String, GetStagesByIdModel>> getStagesById(
      {required int stageId}) async {
    final response =
        await DioHelper.get(EndPoints.stageById(id: stageId), headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success getGroupsById");
        print(response.data);
        return Right(
            GetStagesByIdModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SearchModel>> searchInStage(
      {required String groupNumber}) async {
    final response = await DioHelper.post(EndPoints.search, body: {
      'group_number': groupNumber
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success getGroupsById");
        print(response.data);
        return Right(SearchModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(SearchErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
