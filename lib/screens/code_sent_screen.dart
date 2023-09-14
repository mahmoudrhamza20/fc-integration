import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/core/utils/validator.dart';
import 'package:shared/screens/accept_join_to_group.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CodeSentScreen extends StatelessWidget {
  const CodeSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
        appBar: AppBar(
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
              'ادخل الكود',
              style: TextStyle(color: BrandColors.primary, fontSize: 18),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 300,
                  child: customTextField(
                      validator: (value) => Validator.generalField(value),
                      endIcon: null,
                      startIcon: null,
                      hintText: 'الكود',
                      isPassword: false,
                      controller: codeController,
                      type: TextInputType.number),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            customButton(
                text: 'التالي',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    MagicRouter.navigateTo(const AcceptJoinToGroupScreen());
                  }
                },
                context: context),
          ]),
        ));
  }
}
