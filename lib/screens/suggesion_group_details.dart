import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/screens/code_sent_screen.dart';
import 'package:shared/widgets/custom_card.dart';
import '../widgets/custom_button.dart';

class SuggesionGroupDetailsScreen extends StatelessWidget {
  const SuggesionGroupDetailsScreen(
      {super.key,
      // required this.searchGroup,
      required this.stage,
      required this.groupNumber,
      required this.founderName,
      required this.founderPhone,
      required this.currency,
      required this.value,
      required this.groupId,
      required this.founderId});
  // final SearchGroup searchGroup;
  final String stage;
  final String groupNumber;
  final String founderName;
  final String founderPhone;
  final String currency;
  final dynamic value;
  final int groupId;
  final int founderId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BrandColors.primary,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 100,
                  color: BrandColors.primary,
                ),
              ),
              SizedBox(height: 20.h),
              customCard(title: stage, width: 300.w, height: 60.h),
              customCard(
                  title: groupNumber.toString(), width: 300.w, height: 60.h),
              customCard(title: founderName, width: 300.w, height: 60.h),
              customCard(title: founderPhone, width: 300.w, height: 60.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customCard(
                          title: currency, width: 50.w, height: 60.h),
                    ),
                    Expanded(
                      child: customCard(
                          title: value.toString(), width: 50.w, height: 60.h),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 240.w,
                height: 70.h,
                child: const Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'ملحوظة ',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      'عليك التواصل مع صاحب المجموعه اولا',
                      style: TextStyle(color: BrandColors.primary),
                    ),
                    Text(
                      'للحصول علي الكود الخاص بك٫',
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 2,
                      style: TextStyle(color: BrandColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              customButton(
                  text: 'التالي',
                  onTap: () => MagicRouter.navigateTo(CodeSentScreen(
                        groupId: groupId,
                        founderId: founderId,
                      )),
                  context: context),
            ]),
          ),
        ));
  }
}
