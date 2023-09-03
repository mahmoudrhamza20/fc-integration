// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/logout_model.dart';

class LoginRepo {
  Future<Either<String, LogoutModel>> logout() async {
    final response = await DioHelper.post(EndPoints.logout, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success LogoutRepo");
        print(response.data);
        return Right(LogoutModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(LogoutModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
