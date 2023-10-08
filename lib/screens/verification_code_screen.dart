import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pinput/pinput.dart';
import 'package:shared/core/utils/brand_colors.dart';

import 'package:shared/cubits/login_cubit/cubit/login_cubit.dart';

import 'package:shared/widgets/custom_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({
    super.key,
    required this.phone,
    required this.countryCode,
  });
  final String phone;
  final String countryCode;
  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(70, 69, 66, 1),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 253, 222),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = LoginCubit.of(context);
          return SafeArea(
            child: Form(
              key: cubit.checkOtpFormKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 150,
                      color: BrandColors.primary,
                      child: const Center(child: Text("")),
                    ),
                  ),
                  const Text(
                    'رمز التحقق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Pinput(
                        showCursor: true,
                        cursor: cursor,
                        length: 4,
                        controller: cubit.checkOtpController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.05999999865889549),
                                offset: Offset(0, 3),
                                blurRadius: 16,
                              )
                            ],
                          ),
                        ),
                        validator: (s) {
                          return s == '1111' ? null : '';
                        },
                        // onCompleted: (value) {
                        // widget.code = value;
                        // cubit.checkCode(code: value);
                        // },
                      )),
                  SizedBox(height: 20.h),
                  state is CheckOtpLoading
                      ? const CircularProgressIndicator()
                      : customButton(
                          text: 'التالى',
                          context: context,
                          onTap: () {
                            if (cubit.checkOtpFormKey.currentState!
                                .validate()) {
                              cubit.checkOtp(
                                  phone: widget.phone,
                                  countryCode: widget.countryCode);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: BrandColors.primary,
                                content: Text(
                                  "رمز التحقق غير صحيح",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ));
                            }
                          },
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
