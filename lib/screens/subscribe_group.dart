import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/stages_cubit/cubit/stages_cubit.dart';
import 'package:shared/models/stages_model.dart';
import 'package:shared/screens/first_stage_screen.dart';
import 'package:shared/widgets/custom_card.dart';

class SubscribeGroup extends StatelessWidget {
  const SubscribeGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => StagesCubit()..getStages(),
          child: BlocBuilder<StagesCubit, StagesState>(
            builder: (context, state) {
              final cubit = StagesCubit.of(context);
              return SafeArea(
                  child: SingleChildScrollView(
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
                          "المراحل المتاحة للمشترك",
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
                state is StagesLoading && cubit.stage!.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.stage!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StagesRow(
                              stage: cubit.stage![index],
                            );
                          },
                        ),
                      ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       // 'المرحلة',
                //       "المرحلة السابقة",
                //       style: TextStyle(
                //         fontSize: 18.sp,
                //         color: BrandColors.primary,
                //       ),
                //     ),
                //     SizedBox(width: 30.w),
                //     InkWell(
                //         onTap: () {
                //           MagicRouter.navigateTo(const FirstStageScreen());
                //         },
                //         child:
                //             customCard(title: 'الأولي', width: 120.w, height: 60.h)),
                //   ],
                // ),
                // SizedBox(height: 10.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "المرحلة التالية",
                //       style: TextStyle(
                //         fontSize: 18.sp,
                //         color: BrandColors.primary,
                //       ),
                //     ),
                //     SizedBox(width: 45.w),
                //     InkWell(
                //         onTap: () {
                //           MagicRouter.navigateTo(const SecondStageScreen());
                //         },
                //         child:
                //             customCard(title: 'الثانية', width: 120.w, height: 60.h)),
                //   ],
                // ),
                SizedBox(height: 20.h),
              ])));
            },
          ),
        ));
  }
}

class StagesRow extends StatelessWidget {
  const StagesRow({
    super.key,
    required this.stage,
  });
  final Stage stage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' ${stage.name}',
          // "المرحلة السابقة",
          style: TextStyle(
            fontSize: 18.sp,
            color: BrandColors.primary,
          ),
        ),
        SizedBox(width: 30.w),
        InkWell(
            onTap: () {
              MagicRouter.navigateTo(FirstStageScreen(
                stageId: stage.id,
                stageName: stage.name,
              ));
            },
            child: customCard(title: stage.name, width: 120.w, height: 60.h)),
      ],
    );
  }
}
