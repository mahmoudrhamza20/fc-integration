import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/home_screen.dart';
import 'package:shared/widgets/custom_button.dart';

class AddRequestToCreateGroupScreen extends StatelessWidget {
  const AddRequestToCreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 200,
            color: BrandColors.primary,
          ),
        ),
        Text("تقديم طلب",
            style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(' تاسيس مجموعة خاصة جديدة',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp)),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: customButton(
              text: 'تقديم الطلب',
              onTap: () => MagicRouter.navigateAndPopUntilFirstPage(
                  const AfterAddRequest()),
              context: context),
        ),
      ],
    )));
  }
}

class AfterAddRequest extends StatelessWidget {
  const AfterAddRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 200,
            color: BrandColors.primary,
          ),
        ),
        Text("تم تقديم الطلب بنجاح ",
            style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
        Text(" سيتم الرد عليكم بعد دراسة الطلب",
            style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
        Text("وسيتم ارسال رسالة لك برقم المجموعة  ",
            style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
        Text('لبدء العمل عند الموافقة ان شاء الله',
            style: TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: customButton(
              text: 'العودة',
              onTap: () =>
                  MagicRouter.navigateAndPopUntilFirstPage(const HomeScreen()),
              context: context),
        ),
      ],
    )));
  }
}
