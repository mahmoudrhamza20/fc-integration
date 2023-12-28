import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/validator.dart';
import 'package:shared/cubits/reset_pass_cubit/cubit/reset_pass_cubit.dart';
import 'package:shared/widgets/custom_button.dart';
import 'package:shared/widgets/custom_text_field.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen(
      {super.key, required this.phone, required this.countryCode});
  final String phone;
  final String countryCode;
  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ResetPassCubit, ResetPassState>(
        builder: (context, state) {
          final cubit = ResetPassCubit.of(context);
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: cubit.resetPassFormKey,
                child: Column(
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
                                "برجاء أعد تعين كلمة المرور",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            " كلمة المرور الجديده",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.w,
                                color: BrandColors.primary),
                          ),
                          SizedBox(height: 5.w),
                          customTextField(
                              startIcon: const Icon(Icons.lock),
                              isPassword: showPassword == false ? false : true,
                              type: TextInputType.visiblePassword,
                              validator: (value) => Validator.password(value),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              endIcon: showPassword == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              controller: cubit.passController,
                              hintText: 'برجاء ادخال كلمة المرور'),
                          SizedBox(height: 15.w),
                          Text(
                            "تأكيد كلمة المرور",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.w,
                                color: BrandColors.primary),
                          ),
                          SizedBox(height: 5.w),
                          customTextField(
                              startIcon: const Icon(Icons.lock),
                              isPassword: showPassword == false ? false : true,
                              type: TextInputType.visiblePassword,
                              validator: (value) => Validator.confirmPassword(
                                  value, cubit.passController.text),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              endIcon: showPassword == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              controller: cubit.confirmPassController,
                              hintText: 'برجاء ادخال كلمة المرور'),
                          SizedBox(
                            height: 10.h,
                          ),
                          state is ResetPassLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: customButton(
                                      text: 'تم',
                                      onTap: () => cubit.resetPass(
                                          phone: widget.phone,
                                          countryCode: widget.countryCode),
                                      context: context),
                                ),
                          SizedBox(
                            height: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
