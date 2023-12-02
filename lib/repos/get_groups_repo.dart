// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/error_model.dart';
import 'package:shared/models/group_by_id_model.dart';
import 'package:shared/models/search_keyword_model.dart';
import '../models/get_groubs_model.dart';

class GetGroupsRepo {
  Future<Either<String, GetGroupsModel>> getGroups() async {
    final response = await DioHelper.get(EndPoints.groups, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success GetGroupsRepo");
        print(response.data);
        return Right(GetGroupsModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetGroupsByIdModel>> getGroupsById(
      {required int groubId}) async {
    final response =
        await DioHelper.get(EndPoints.groupById(id: groubId), headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success getGroupsById");
        print(response.data);
        return Right(
            GetGroupsByIdModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SearchKeywordsModel>> searchKeywords(
      {required int groupId}) async {
    final response =
        await DioHelper.get(EndPoints.searchKeywords(id: groupId), headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success searchKeywords");
        print(response.data);
        return Right(
            SearchKeywordsModel.fromJson(jsonDecode(response.toString())));
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
