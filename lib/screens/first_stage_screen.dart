import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/cubits/stages_cubit/cubit/stages_cubit.dart';
import 'package:shared/screens/suggesion_group_details.dart';
import 'package:shared/widgets/custom_button.dart';
import '../core/utils/magic_router.dart';
import '../widgets/custom_text_field.dart';

class FirstStageScreen extends StatelessWidget {
  const FirstStageScreen({
    super.key,
    required this.stageName,
    required this.stageId,
  });

  final String stageName;
  final int stageId;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => StagesCubit()..getStagesById(stageId: stageId),
          child: BlocBuilder<StagesCubit, StagesState>(
            builder: (context, state) {
              final cubit = StagesCubit.of(context);
              return SingleChildScrollView(
                child: SafeArea(
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
                              stageName,
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
                          // onChanged: (vlue) {
                          //   cubit.searchInStage(groupNumber: vlue);
                          //   print(vlue);
                          // },
                          endIcon: null,
                          startIcon: null,
                          hintText: 'رقم المجموعة',
                          isPassword: false,
                          controller: codeController,
                          type: TextInputType.number),
                    ),
                    SizedBox(height: 20.h),
                    customButton(
                        text: 'البحث',
                        onTap: () {
                          cubit.searchInStage(groupNumber: codeController.text);
                          print(codeController.text);
                        },
                        context: context),
                    const SizedBox(
                      height: 20,
                    ),
                    cubit.searchGroup!.isEmpty
                        ? Container()
                        : SizedBox(
                            height: 50,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cubit.searchGroup!.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    Center(
                                      child: InkWell(
                                        onTap: () => MagicRouter.navigateTo(
                                            SuggesionGroupDetailsScreen(
                                          searchGroup:
                                              cubit.searchData!.groups[index],
                                        )),
                                        child: Text(
                                          cubit.searchGroup![index].groupNumber
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ))),
                    SizedBox(height: 10.h),
                    Text(
                      "مجموعات مقترحة أخري",
                      style: TextStyle(
                          fontSize: 16.sp, color: BrandColors.primary),
                    ),
                    SizedBox(height: 10.h),
                    // InkWell(
                    //   onTap: () =>
                    //       MagicRouter.navigateTo(const SuggesionGroupDetailsScreen()),
                    //   child: Text(
                    //     "1205",
                    //     style:
                    //         TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.suggestedGroup!.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Center(
                          child: InkWell(
                            // onTap: () => MagicRouter.navigateTo(
                            //     SuggesionGroupDetailsScreen(
                            //         searchGroup:
                            //             cubit.searchData!.groups[index])),
                            child: Center(
                              child: Text(
                                cubit.suggestedGroup![index].groupNumber ?? '',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        ));
  }
}
