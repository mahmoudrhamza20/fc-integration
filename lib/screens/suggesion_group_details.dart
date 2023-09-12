import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/code_sent_screen.dart';
import 'package:shared/widgets/custom_card.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SuggesionGroupDetailsScreen extends StatelessWidget {
  const SuggesionGroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
            SizedBox(height: 20.h),
            customCard(title: 'المرحلة', width: 300.w, height: 60.h),
            customCard(title: 'رقم المجموعة', width: 300.w, height: 60.h),
            customCard(title: 'إسم المركز الأول', width: 300.w, height: 60.h),
            customCard(title: 'رقم الموبايل', width: 300.w, height: 60.h),
            SizedBox(height: 20.h),
            customButton(
                text: 'التالي',
                onTap: () => MagicRouter.navigateTo(const CodeSentScreen()),
                context: context),
          ]),
        ));
  }
}
