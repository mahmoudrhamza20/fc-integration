import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/validator.dart';
import 'package:shared/cubits/reset_pass_cubit/cubit/reset_pass_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddCodeToResetPassScreen extends StatelessWidget {
  const AddCodeToResetPassScreen({
    super.key,
    required this.phone,
    required this.countryCode,
  });
  final String phone;
  final String countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: BlocBuilder<ResetPassCubit, ResetPassState>(
              builder: (context, state) {
                final cubit = ResetPassCubit.of(context);
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          height: 200,
                          color: BrandColors.primary,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const Text(
                        'ادخل الكود',
                        style:
                            TextStyle(color: BrandColors.primary, fontSize: 18),
                      ),
                      Form(
                        key: cubit.formKey2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 300,
                            child: customTextField(
                                validator: (value) =>
                                    Validator.generalField(value),
                                endIcon: null,
                                startIcon: null,
                                hintText: 'الكود',
                                isPassword: false,
                                controller: cubit.codeController,
                                type: TextInputType.text),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      state is ResetPassLoading
                          ? const Center(child: CircularProgressIndicator())
                          : customButton(
                              text: 'التالي',
                              onTap: () => cubit.checkOtpToResetPass(
                                  phone: phone, countryCode: countryCode),
                              context: context),
                    ]);
              },
            ),
          ),
        ));
  }
}
