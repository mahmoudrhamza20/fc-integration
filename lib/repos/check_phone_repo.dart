// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/check_otb_error_model.dart';
import 'package:shared/models/check_otb_model.dart';
import 'package:shared/models/check_phone_model.dart';
import 'package:shared/models/error_model.dart';

class CheckPhoneRepo {
  Future<Either<String, CheckPhoneModel>> checkPhone({
    required String phone,
  }) async {
    final response = await DioHelper.post(EndPoints.checkPhone, body: {
      'phone': phone,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success LoginRepo");
        print(response.data);
        return Right(CheckPhoneModel.fromJson(jsonDecode(response.toString())));
      } else if (response.data['result'] == false &&
          response.data['status'] == 422) {
        return Left(CheckPhoneModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .message
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CheckOtbModel>> checkOtp(
      {required String phone, required String otp}) async {
    final response = await DioHelper.post(EndPoints.checkOtp, body: {
      'phone': phone,
      'otp': otp,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success LogoutRepo");
        print(response.data);
        return Right(CheckOtbModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(CheckOtbErrorModel.fromJson(jsonDecode(response.toString()))
            .errors[0]
            .otp
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
