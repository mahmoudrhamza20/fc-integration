// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared/core/utils/dio_string.dart';
import 'package:shared/models/user_error_model.dart';
import '../../../../core/utils/dio_helper.dart';
import '../models/user_model.dart';

class RegisterRepo {
  Future<Either<dynamic, UserModel>> register({
    required String name,
    required String phone,
    required String gender,
    required String passwordConfermation,
    required String password,
    required String dateOfBirth,
    required String governorate,
    required String cityController,
    required String villageController,
    required String token,
  }) async {
    final response = await DioHelper.post(EndPoints.register, body: {
      'name': name,
      'phone': phone,
      'password': password,
      'gender': gender,
      'confirm_password': passwordConfermation,
      'dob': dateOfBirth,
      'country': governorate,
      'address': cityController,
      'region': villageController,
      'device_token': token,
    }, headers: {
      'Accept-Language': 'ar',
      'Accept': 'application/json'
    });
    print(cityController);
    print(phone);
    print(name);
    print(password);
    print(gender);
    print(passwordConfermation);
    print(villageController);
    print(dateOfBirth);
    print(governorate);
    print(cityController);
    print(token);
    try {
      if (response.statusCode == 200 &&
          response.data['status'] == 200 &&
          response.data['result'] == true) {
        print("Success RegisterRepo");
        print(response.data);
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        final error = UserModeError.fromJson(jsonDecode(response.toString()));
        final errorMessages =
            error.errors.map((error) => error.toString()).toList();
        return Left(errorMessages.join('\n'));
        //   return Left(UserModeError.fromJson(jsonDecode(response.toString()))
        //       .errors[0]
        //       .phone
        //       .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
