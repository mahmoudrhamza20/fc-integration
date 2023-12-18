import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/establish_group_cubit/cubit/establish_group_cubit.dart';
import 'package:shared/screens/home_screen.dart';
import 'package:shared/widgets/custom_button.dart';

class AddRequestToCreateGroupScreen extends StatelessWidget {
  const AddRequestToCreateGroupScreen({super.key, required this.stageId});
  final int stageId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => EstablishGroupCubit(),
      child: BlocBuilder<EstablishGroupCubit, EstablishGroupState>(
        builder: (context, state) {
          final cubit = EstablishGroupCubit.of(context);
          return Column(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 200,
                  color: BrandColors.primary,
                ),
              ),
              Text("تقديم طلب",
                  style:
                      TextStyle(color: BrandColors.primary, fontSize: 16.sp)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(' تاسيس مجموعة خاصة جديدة',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp)),
              ),
              SizedBox(
                height: 20.h,
              ),
              state is EstablishGroupLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: customButton(
                          text: 'تقديم الطلب',
                          onTap: () => cubit.establishGroup(stageId: stageId),
                          context: context),
                    ),
            ],
          );
        },
      ),
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
