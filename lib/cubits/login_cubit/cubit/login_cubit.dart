import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/utils/app_func.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/models/user_model.dart';
import 'package:shared/repos/check_phone_repo.dart';
import 'package:shared/screens/complete_screen.dart';
import 'package:shared/screens/login_screen.dart';
import 'package:shared/screens/verification_code_screen.dart';
import '../../../core/utils/magic_router.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../repos/login_repo.dart';
import '../../../screens/home_screen.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final loginRepo = LoginRepo();
  final checkPhoneRepo = CheckPhoneRepo();

  UserData? userData;
  static LoginCubit of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> checkPhoneFormKey = GlobalKey();
  GlobalKey<FormState> checkOtpFormKey = GlobalKey();
  bool showPassword = true;
  final phoneController = TextEditingController();
  final checkPhoneController = TextEditingController();
  final checkOtpController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(LoginLoading());
      final res = await loginRepo.login(
        password: passwordController.text,
        phone: phoneController.text,
        token: await AppFunc.getTokenDevice(),
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(LoginError());
        },
        (res) async {
          showSnackBar(res.message);
          userData = res.data.user;
          print(res.data.token);
          await AppStorage.cacheToken(res.data.token!);
          await AppStorage.cacheUserInfo(res);
          //   CacheHelper.saveData(key: 'login', value: true);
          log('-----------------');
          print(userData!.id);
          log(AppStorage.getToken!);
          log('-----------------');
          MagicRouter.navigateAndPopAll(const HomeScreen());
          emit(LoginLoaded());
        },
      );
    }
  }

  Future checkPhone() async {
    if (checkPhoneFormKey.currentState!.validate()) {
      checkPhoneFormKey.currentState!.save();
      emit(CheckPhoneLoading());
      final res = await checkPhoneRepo.checkPhone(
        phone: checkPhoneController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err);
          emit(CheckPhoneError());
        },
        (res) async {
          showSnackBar(res.message);
          MagicRouter.navigateTo(
              VerificationCodeScreen(phone: checkPhoneController.text));
          checkPhoneController.clear();
          emit(CheckPhoneLoaded());
        },
      );
    }
  }

  Future checkOtp({required String phone}) async {
    if (checkOtpFormKey.currentState!.validate()) {
      checkOtpFormKey.currentState!.save();
      emit(CheckOtpLoading());
      final res = await checkPhoneRepo.checkOtp(
        phone: phone,
        otp: checkOtpController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err);
          print(err);
          emit(CheckOtpError());
        },
        (res) async {
          showSnackBar(res.message);
          print(res.message);
          MagicRouter.navigateAndPopAll(CompleteProfileScreen(phone: phone));
          checkOtpController.clear();
          emit(CheckOtpLoaded());
        },
      );
    }
  }

  Future logout() async {
    emit(LogoutLoading());
    final res = await loginRepo.logout();
    res.fold(
      (err) {
        showSnackBar(err);
        emit(LogoutError());
      },
      (res) async {
        showSnackBar(res.message);
        AppStorage.signOut();
        MagicRouter.navigateAndPopAll(const LoginScreen());
        emit(LogoutLoaded());
      },
    );
  }
}
