import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/utils/app_func.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/core/utils/local_cache_helper.dart';
import 'package:shared/models/user_model.dart';
import 'package:shared/screens/splash_screen.dart';
import '../../../core/utils/magic_router.dart';
import '../../../core/widgets/custom_snackbar.dart';
import '../../../repos/login_repo.dart';
import '../../../screens/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final loginRepo = LoginRepo();

  UserData? userData;
  static LoginCubit of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  bool showPassword = true;
  final phoneController = TextEditingController();
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
          log('-----------------');
          print(userData!.name);
          log(AppStorage.getToken!);
          log('-----------------');
          MagicRouter.navigateAndPopAll(const HomeScreen());
          emit(LoginLoaded());
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
        MagicRouter.navigateAndPopAll(const SecondPage());
        emit(LogoutLoaded());
      },
    );
  }
}
