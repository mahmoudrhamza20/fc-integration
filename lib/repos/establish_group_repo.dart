import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/error_model.dart';
import 'package:shared/models/establish_group_model.dart';

class EstablishGroupRepo {
  Future<Either<String, EstablishGroupModel>> establishGroup() async {
    final response =
        await DioHelper.postwithoutBody(EndPoints.establishGroup, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });
    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        log("Success establishGroup");
        return Right(
            EstablishGroupModel.fromJson(jsonDecode(response.toString())));
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
