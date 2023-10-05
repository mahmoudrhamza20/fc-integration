// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:shared/core/utils/brand_colors.dart';

import 'package:shared/core/utils/hex_color.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/login_cubit/cubit/login_cubit.dart';

import 'package:shared/screens/login_screen.dart';

import 'package:shared/widgets/custom_button.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(const LoginScreen()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BrandColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: height / _fontSize),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child: Text(
                    'YOUR APP\'S NAME',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: animation1.value,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: width / _containerSize,
                width: width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                // child: Image.asset('assets/images/file_name.png')
                child: const Text(
                  'YOUR APP\'S LOGO',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = LoginCubit.of(context);
            return Column(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 200,
                    color: BrandColors.primary,
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: const Column(
                        children: [
                          Text(
                            "مرحبا بك",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "برجاء تسجيل الدخول كعضو جديد",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: cubit.checkPhoneFormKey,
                    child: Column(
                      children: <Widget>[
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: IntlPhoneField(
                            textAlign: TextAlign.end,
                            controller: cubit.checkPhoneController,
                            keyboardType: TextInputType.phone,
                            pickerDialogStyle: PickerDialogStyle(
                                searchFieldInputDecoration:
                                    const InputDecoration(
                                        hintText: 'أبحث عن البلد')),
                            languageCode: "ar",
                            countries: const [
                              Country(
                                  flag: '🇪🇬',
                                  name: 'مصر',
                                  code: 'EG',
                                  dialCode: '20',
                                  nameTranslations: {},
                                  minLength: 10,
                                  maxLength: 10),
                              Country(
                                  flag: '🇧🇭',
                                  name: 'البحرين',
                                  code: 'BH',
                                  dialCode: '973',
                                  nameTranslations: {},
                                  minLength: 8,
                                  maxLength: 8),
                              Country(
                                  flag: '🇯🇴',
                                  name: 'الاردن',
                                  code: 'JO',
                                  dialCode: '962',
                                  nameTranslations: {},
                                  minLength: 9,
                                  maxLength: 9),
                              Country(
                                  flag: '🇰🇼',
                                  name: 'الكويت',
                                  code: 'KW',
                                  dialCode: '965',
                                  nameTranslations: {},
                                  minLength: 8,
                                  maxLength: 8),
                              Country(
                                  flag: '🇶🇦',
                                  name: 'قطر',
                                  code: 'QA',
                                  dialCode: '974',
                                  nameTranslations: {},
                                  minLength: 8,
                                  maxLength: 8),
                              Country(
                                  flag: '🇸🇦',
                                  name: 'المملكة العربية السعودية',
                                  code: 'SA',
                                  dialCode: '966',
                                  nameTranslations: {},
                                  minLength: 9,
                                  maxLength: 9),
                              Country(
                                  flag: '🇦🇪',
                                  name: 'الإمارات العربية المتحدة',
                                  code: 'AE',
                                  dialCode: '971',
                                  nameTranslations: {},
                                  minLength: 9,
                                  maxLength: 9),
                            ],
                            decoration: InputDecoration(
                              // fillColor: HexColor('#F7F8F8'),
                              // labelText: 'رقم الهاتف',
                              // border: const OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(Radius.circular(15)),
                              //   borderSide: BorderSide(),
                              // ),
                              errorStyle:
                                  const TextStyle(color: BrandColors.primary),
                              contentPadding: EdgeInsets.all(16.w),
                              isDense: true,
                              filled: true,
                              fillColor: HexColor('#F7F8F8'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14.r),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.r),
                                  borderSide: const BorderSide(
                                      width: 1, color: BrandColors.primary)),
                              hintMaxLines: 1,
                              hintText: 'رقم الهاتف',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  color: HexColor('#B5B5B5')),
                            ),
                            initialCountryCode: 'EG',
                            onChanged: (phone) {
                              // print(phone.completeNumber);
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: state is CheckPhoneLoading
                              ? const CircularProgressIndicator()
                              : customButton(
                                  text: 'تسجيل',
                                  onTap: () {
                                    cubit.checkPhone();
                                    print(
                                      cubit.checkPhoneController.text,
                                    );
                                  },
                                  context: context),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'هل لديك حساب؟',
                              style: TextStyle(
                                  fontSize: 14.w, color: HexColor("#9098B1")),
                            ),
                            TextButton(
                              onPressed: () {
                                MagicRouter.navigateTo(const LoginScreen());
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
