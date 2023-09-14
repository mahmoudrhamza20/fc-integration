import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/home_screen.dart';

class AcceptJoinToGroupScreen extends StatelessWidget {
  const AcceptJoinToGroupScreen({super.key});

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
            const Text(
              'تم الإشتراك بالمجموعة ',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            const Text(
              'للمرحلة (الأولى)',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            const Text(
              'مجموعة الأكواد الخاصة بك',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        '${index + 111}',
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
