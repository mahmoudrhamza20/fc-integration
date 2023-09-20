import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/cubits/get_groups_cubit/cubit/get_groups_cubit.dart';
import 'package:shared/widgets/custom_card.dart';

class GroupDetails extends StatelessWidget {
  const GroupDetails({
    super.key,
    required this.groubId,
    required this.name,
    required this.stage,
    required this.groupNumber,
    //  required this.groupById
  });

  final int groubId;
  final String name;
  final String stage;
  final String groupNumber;
  //final GroupById groupById;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => GetGroupsCubit()
            ..searchKeywords()
            ..getGroupsById(groubId: groubId),
          child: BlocBuilder<GetGroupsCubit, GetGroupsState>(
            builder: (context, state) {
              final cubit = GetGroupsCubit.of(context);
              return SafeArea(
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
                            name,
                            // "المجموعة $numberGroup",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                  customCard(title: stage, width: 300.w, height: 60.h),
                  customCard(
                      title: groupNumber.toString(),
                      width: 300.w,
                      height: 60.h),
                  customCard(
                      title: 'الترتيب الحالي', width: 300.w, height: 60.h),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: customCard(
                              title: 'العملة', width: 50.w, height: 60.h),
                        ),
                        Expanded(
                          child: customCard(
                              title: 'السعر', width: 50.w, height: 60.h),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "الأكواد المتاحة",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: BrandColors.primary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  state is SearchKeywordsLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: 200,
                          child: ListView.builder(
                              itemCount: cubit.codes!.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Text(
                                    cubit.codes![index],
                                    // '${index + 111}',
                                    style: const TextStyle(
                                        color: BrandColors.primary,
                                        fontSize: 18),
                                  ),
                                );
                              }),
                        ),
                  // Text(
                  //     cubit.searchKeywordsData2 ?? '',
                  //     style: const TextStyle(fontSize: 16),
                  //   ),
                  // const Text(
                  //   'EG27L12158',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                ]),
              );
            },
          ),
        ));
  }
}
