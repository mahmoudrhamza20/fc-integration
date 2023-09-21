import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/models/search_model.dart';
import 'package:shared/screens/code_sent_screen.dart';
import 'package:shared/widgets/custom_card.dart';
import '../widgets/custom_button.dart';

class SuggesionGroupDetailsScreen extends StatelessWidget {
  const SuggesionGroupDetailsScreen({super.key, required this.searchGroup});
  final SearchGroup searchGroup;
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
              customCard(title: searchGroup.stage, width: 300.w, height: 60.h),
              customCard(
                  title: searchGroup.groupNumber.toString(),
                  width: 300.w,
                  height: 60.h),
              customCard(
                  title: searchGroup.founder.name, width: 300.w, height: 60.h),
              customCard(
                  title: searchGroup.founder.phone, width: 300.w, height: 60.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customCard(
                          title: searchGroup.currency,
                          width: 50.w,
                          height: 60.h),
                    ),
                    Expanded(
                      child: customCard(
                          title: searchGroup.value.toString(),
                          width: 50.w,
                          height: 60.h),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              customButton(
                  text: 'التالي',
                  onTap: () => MagicRouter.navigateTo(CodeSentScreen(
                        searchGroup: searchGroup,
                      )),
                  context: context),
            ]),
          ),
        ));
  }
}
