// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/dio_helper.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/check_otb_error_model.dart';
import 'package:shared/models/check_otp_model2.dart.dart';
import 'package:shared/models/check_phone_to%20_reset_pass_error2.dart';
import 'package:shared/models/check_phone_to_reset_pass_error_model.dart';
import 'package:shared/models/reset_pass_model.dart';
import '../models/check_otb_error_model2.dart';
import '../models/check_phone_to_reset_pass_model.dart';

class ResetPassRepo {
  Future<Either<String, CheckPhoneToResetPassModel>> checkPhoneToResetPass({
    required String phone,
    required String countryCode,
  }) async {
    final response =
        await DioHelper.post(EndPoints.checkPhoneToResetPass, body: {
      'phone': phone,
      'country_code': countryCode,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json'
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success checkPhoneToResetPass");
        print(response.data);
        return Right(CheckPhoneToResetPassModel.fromJson(
            jsonDecode(response.toString())));
      } else if (response.statusCode == 422) {
        return Left(CheckPhoneToResetPassErrorModel2.fromJson(
                jsonDecode(response.toString()))
            .message
            .toString());
      } else {
        final errorData = CheckPhoneToResetPassErrorModel.fromJson(
            jsonDecode(response.toString()));

        // Extract the error messages from the list of maps
        List<String> errorMessages = [];
        for (var errorItem in errorData.errors) {
          for (var errorMessage in errorItem.values) {
            errorMessages.add(errorMessage);
          }
        }

        // Return the concatenated error messages
        return Left(errorMessages.join('\n'));
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CheckOtpModel>> checkOtpToResetPass(
      {required String phone,
      required String otp,
      required String countryCode}) async {
    final response = await DioHelper.post(EndPoints.checkOtpToResetPass, body: {
      'phone': phone,
      'otp': otp,
      'country_code': countryCode,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
    });
    print(phone);
    print(otp);
    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success checkOtpToResetPass");
        print(response.data);
        return Right(CheckOtpModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(
            CheckOtpErrorModel2.fromJson(jsonDecode(response.toString()))
                .message
                .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, ResetPassModel>> resetPass(
      {required String phone,
      required String password,
      required String confirmPassword,
      required String countryCode,
      required String token}) async {
    final response = await DioHelper.post(EndPoints.resetPassword, body: {
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
      'country_code': countryCode,
      'device_token': token,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
    });

    try {
      if (response.statusCode == 200 && response.data['result'] == true) {
        print("Success resetPass");
        print(response.data);
        return Right(ResetPassModel.fromJson(jsonDecode(response.toString())));
      } else {
        final errorData =
            CheckOtbErrorModel.fromJson(jsonDecode(response.toString()));

        // Extract the error messages from the list of maps
        List<String> errorMessages = [];
        for (var errorItem in errorData.errors) {
          for (var errorMessage in errorItem.values) {
            errorMessages.add(errorMessage);
          }
        }
        // Return the concatenated error messages
        return Left(errorMessages.join('\n'));
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
