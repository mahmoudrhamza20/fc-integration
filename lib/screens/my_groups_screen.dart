import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/get_groups_cubit/cubit/get_groups_cubit.dart';
import 'package:shared/models/get_groubs_model.dart';
import 'package:shared/models/group_by_id_model.dart';
import 'package:shared/screens/group_details.dart';
import 'package:shared/screens/subscribe_group.dart';
import 'package:shared/widgets/custom_button.dart';

class MyGroupsScreen extends StatefulWidget {
  const MyGroupsScreen({super.key});

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  // List<DataRow> _testRows({
  //   required int index,
  //   required int groupNumber,
  //   required String stage,
  // }) {
  //   return [
  //     DataRow(
  //       cells: <DataCell>[
  //         DataCell(
  //           Text('${index + 1}'),
  //         ),
  //         DataCell(
  //           TextButton(
  //               onPressed: () {
  //                 MagicRouter.navigateTo(GroupDetails(
  //                   numberGroup: groupNumber.toString(),
  //                 ));
  //               },
  //               child: Text(
  //                 groupNumber.toString(),
  //               )),
  //         ),
  //         DataCell(
  //           Text(stage),
  //         ),
  //       ],
  //     ),
  //     DataRow(
  //       cells: <DataCell>[
  //         const DataCell(
  //           Text('2'),
  //         ),
  //         DataCell(
  //           TextButton(
  //               onPressed: () {
  //                 MagicRouter.navigateTo(const GroupDetails(
  //                   numberGroup: '٦٢٥٨',
  //                 ));
  //               },
  //               child: const Text('٦٢٥٨')),
  //         ),
  //         const DataCell(
  //           Text('الثانية'),
  //         ),
  //       ],
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => GetGroupsCubit()..getGroups(),
        child: SafeArea(
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 100,
                  color: BrandColors.primary,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        "المجموعات الحالية",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                "حدد المجموعات المطلوب متابعتها",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: BrandColors.primary,
                        width: 2,
                      ),
                    ),
                    child: BlocBuilder<GetGroupsCubit, GetGroupsState>(
                      builder: (context, state) {
                        final cubit = GetGroupsCubit.of(context);
                        return SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'م',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: BrandColors.primary,
                                      ),
                                    ),
                                    Text(
                                      'رقم المجموعة',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: BrandColors.primary,
                                      ),
                                    ),
                                    Text(
                                      'المرحلة',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: BrandColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              state is GetGroupsLoading
                                  ? const CircularProgressIndicator()
                                  : cubit.groupData!.isEmpty
                                      ? const Center(
                                          child: Text(
                                            'لا يوجد مجموعات',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: BrandColors.primary,
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 80.h,
                                          child: ListView.separated(
                                            itemCount: cubit.groupData!.length,
                                            itemBuilder: (context, index) =>
                                                BuildRow(
                                              index: index,
                                              groupData:
                                                  cubit.groupData![index],
                                              // groupById: cubit.groupById!,
                                            ),
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const Divider(),
                                          ),
                                        )
                            ],
                          ),
                        );
                      },
                    )),
              ),
              //    SizedBox(
              //       child: DataTable(columns: const <DataColumn>[
              //     DataColumn(
              //       label: Text(
              //         'م',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: BrandColors.primary,
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'رقم المجموعة',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: BrandColors.primary,
              //         ),
              //       ),
              //     ),
              //     DataColumn(
              //       label: Text(
              //         'المرحلة',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: BrandColors.primary,
              //         ),
              //       ),
              //     ),
              //   ], rows: _testRows(index: 0, groupNumber: 11, stage: 'stage'))),
              // ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {
                  MagicRouter.navigateTo(const SubscribeGroup());
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.group_add,
                      size: 40,
                      color: BrandColors.primary,
                    ),
                    Text(
                      'الأشتراك في مجموعة جديدة',
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              customButton(
                  text: 'الحركة المالية', onTap: () {}, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({
    super.key,
    required this.index,
    required this.groupData,
    //required this.groupById,
  });
  final int index;
  // final GroupById groupById;
  final Group groupData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: BrandColors.primary,
            ),
          ),
          TextButton(
            onPressed: () {
              MagicRouter.navigateTo(GroupDetails(
                groupNumber: groupData.groupNumber.toString(),
                groubId: groupData.id,
                name: groupData.name,
                stage: groupData.stage,
              ));
            },
            child: Text(
              groupData.groupNumber.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: BrandColors.primary,
              ),
            ),
          ),
          Text(
            groupData.stage.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: BrandColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
