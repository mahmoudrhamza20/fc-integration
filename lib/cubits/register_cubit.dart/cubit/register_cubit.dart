import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/utils/app_func.dart';
import 'package:shared/core/utils/app_storage.dart';

import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/core/widgets/custom_snackbar.dart';
import 'package:shared/screens/privacy_screen.dart';

import '../../../repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final registerRepo = RegisterRepo();
  static RegisterCubit of(context) => BlocProvider.of(context);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final coPasswordController = TextEditingController();
  final genderController = TextEditingController();
  final governorateController = TextEditingController();
  final cityController = TextEditingController();
  final villageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future register({required String phone}) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final res = await registerRepo.register(
        phone: phone,
        cityController: cityController.text,
        dateOfBirth: dateController.text,
        gender: genderController.text,
        governorate: governorateController.text,
        passwordConfermation: coPasswordController.text,
        villageController: villageController.text,
        name: nameController.text,
        password: passwordController.text,
        token: await AppFunc.getTokenDevice(),
      );

      res.fold(
        (err) {
          showSnackBar(err);
          print(err);
          emit(RegisterError());
        },
        (res) async {
          showSnackBar(res.message);
          print(res.data.user.id);
          emit(RegisterLoaded());
          AppStorage.cacheUserInfo(res);
          await AppStorage.isLoged(true);
          await AppStorage.cacheToken(res.data.token!);
          log('-----------------');
          log(AppStorage.getToken!);
          log('-----------------');
          MagicRouter.navigateTo(const PrivacyScreen());
        },
      );
    }
  }
}
