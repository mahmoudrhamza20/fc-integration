import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/repos/reset_pass_repo.dart';
import 'package:shared/screens/add_code_to_reset_pass_screen.dart';

import '../../../core/utils/app_func.dart';
import '../../../core/utils/magic_router.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../screens/login_screen.dart';
import '../../../screens/reset_pass_screen.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit() : super(ResetPassInitial());
  static ResetPassCubit of(context) => BlocProvider.of(context);
  final resetPassRepo = ResetPassRepo();

  final codeController = TextEditingController();
  final checkPhoneController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  GlobalKey<FormState> formKey2 = GlobalKey();
  GlobalKey<FormState> checkPhoneFormKey = GlobalKey();
  GlobalKey<FormState> resetPassFormKey = GlobalKey();

  Future checkPhone({required String countryCode}) async {
    if (checkPhoneFormKey.currentState!.validate()) {
      checkPhoneFormKey.currentState!.save();
      emit(ResetPassLoading());
      final res = await resetPassRepo.checkPhoneToResetPass(
        phone: checkPhoneController.text,
        countryCode: countryCode,
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(ResetPassError());
        },
        (res) async {
          showSnackBar(res.message);
          MagicRouter.navigateTo(AddCodeToResetPassScreen(
            phone: checkPhoneController.text,
            countryCode: countryCode,
          ));
          checkPhoneController.clear();
          emit(ResetPassLoaded());
        },
      );
    }
  }

  Future checkOtpToResetPass({
    required dynamic phone,
    required dynamic countryCode,
  }) async {
    if (formKey2.currentState!.validate()) {
      emit(ResetPassLoading());
      final res = await resetPassRepo.checkOtpToResetPass(
          phone: phone, otp: codeController.text, countryCode: countryCode);
      res.fold(
        (err) {
          showSnackBar(err);
          emit(ResetPassError());
        },
        (res) async {
          showSnackBar(res.message);
          MagicRouter.navigateTo(ResetPassScreen(
            phone: phone,
            countryCode: countryCode,
          ));
          codeController.clear();
          checkPhoneController.clear();
          emit(ResetPassLoaded());
        },
      );
    }
  }

  Future resetPass({
    required dynamic phone,
    required dynamic countryCode,
  }) async {
    if (resetPassFormKey.currentState!.validate()) {
      emit(ResetPassLoading());
      final res = await resetPassRepo.resetPass(
        phone: phone,
        countryCode: countryCode,
        password: passController.text,
        confirmPassword: confirmPassController.text,
        token: await AppFunc.getTokenDevice(),
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(ResetPassError());
        },
        (res) async {
          showSnackBar(res.message);
          MagicRouter.navigateTo(const LoginScreen());
          codeController.clear();
          checkPhoneController.clear();
          passController.clear();
          confirmPassController.clear();
          emit(ResetPassLoaded());
        },
      );
    }
  }
}
