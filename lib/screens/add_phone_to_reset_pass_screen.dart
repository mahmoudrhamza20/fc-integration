import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/hex_color.dart';
import 'package:shared/cubits/reset_pass_cubit/cubit/reset_pass_cubit.dart';

import 'package:shared/widgets/custom_button.dart';

class AddPhoneToResetPassScreen extends StatefulWidget {
  const AddPhoneToResetPassScreen({super.key});

  @override
  State<AddPhoneToResetPassScreen> createState() =>
      _AddPhoneToResetPassScreenState();
}

class _AddPhoneToResetPassScreenState extends State<AddPhoneToResetPassScreen> {
  String? countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ResetPassCubit, ResetPassState>(
        builder: (context, state) {
          final cubit = ResetPassCubit.of(context);
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: cubit.checkPhoneFormKey,
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
                                "برجاء إدخال رقم الهاتف الخاص ",
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
                            "رقم الهاتف",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.w,
                                color: BrandColors.primary),
                          ),
                          SizedBox(height: 5.w),
                          IntlPhoneField(
                            textAlign: TextAlign.start,
                            controller: cubit.checkPhoneController,
                            keyboardType: TextInputType.phone,
                            pickerDialogStyle: PickerDialogStyle(
                                searchFieldInputDecoration:
                                    const InputDecoration(
                                        hintText: 'أبحث عن البلد')),
                            languageCode: "ar",
                            decoration: InputDecoration(
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
                              hintText: 'رقم الهاتف (برجاء عدم كتابة 0)',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  color: HexColor('#B5B5B5')),
                            ),
                            initialCountryCode: 'EG',
                            onChanged: (phone) {
                              setState(() {
                                countryCode = phone.countryCode.substring(1);
                              });
                              print(countryCode.toString());
                            },
                          ),
                          state is ResetPassLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: customButton(
                                      text: 'التالي',
                                      onTap: () {
                                        cubit.checkPhone(
                                            countryCode: countryCode!);
                                      },
                                      context: context),
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
