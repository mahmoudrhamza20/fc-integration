import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/widgets/custom_button.dart';
import 'package:shared/widgets/custom_text_field.dart';

class SecondStageScreen extends StatelessWidget {
  const SecondStageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "المرحلة الثانية",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "أدخل رقم مجموعة محددة",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: customTextField(
                  endIcon: null,
                  startIcon: null,
                  hintText: 'رقم المجموعة',
                  isPassword: false,
                  controller: codeController,
                  type: TextInputType.number),
            ),
            SizedBox(height: 20.h),
            customButton(text: 'البحث', onTap: () {}, context: context),
            SizedBox(height: 10.h),
            Text(
              "مجموعات مقترحة أخري",
              style: TextStyle(fontSize: 16.sp, color: BrandColors.primary),
            ),
            SizedBox(height: 10.h),
            Text(
              "1205",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "1205",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "1205",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ]),
        ));
  }
}
