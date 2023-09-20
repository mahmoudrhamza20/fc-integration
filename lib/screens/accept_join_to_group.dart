import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/home_screen.dart';

import '../models/join_goup_model.dart';

class AcceptJoinToGroupScreen extends StatelessWidget {
  const AcceptJoinToGroupScreen(
      {super.key, required this.joinGroupData, required this.codes});
  final JoinGroup joinGroupData;
  final List<String> codes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 100,
                color: BrandColors.primary,
              ),
            ),
            SizedBox(height: 20.h),
            const Text(
              'مبروك',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            Text(
              'تم الإشتراك  في ${joinGroupData.name} ',
              style: const TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            Text(
              joinGroupData.stage,
              // 'للمرحلة (الأولى)',
              style: const TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            const Text(
              'مجموعة الأكواد الخاصة بك',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: codes.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        codes[index],
                        // '${index + 111}',
                        style: const TextStyle(
                            color: BrandColors.primary, fontSize: 18),
                      ),
                    );
                  }),
            ),
            InkWell(
              onTap: () =>
                  MagicRouter.navigateAndPopUntilFirstPage(const HomeScreen()),
              child: const Text(
                'مجموعاتى',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
          ]),
        ));
  }
}
