import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/validator.dart';
import 'package:shared/cubits/stages_cubit/cubit/stages_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class CodeSentScreen extends StatelessWidget {
  const CodeSentScreen({
    super.key,
    required this.groupId,
    required this.founderId,
  });

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
        body: SingleChildScrollView(
          child: SafeArea(
            child: BlocProvider(
              create: (context) => StagesCubit(),
              child: BlocBuilder<StagesCubit, StagesState>(
                builder: (context, state) {
                  final cubit = StagesCubit.of(context);
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                          style: TextStyle(
                              color: BrandColors.primary, fontSize: 18),
                        ),
                        Form(
                          key: cubit.formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 300,
                              child: customTextField(
                                  validator: (value) =>
                                      Validator.generalField(value),
                                  endIcon: null,
                                  startIcon: null,
                                  hintText: 'الكود',
                                  isPassword: false,
                                  controller: cubit.codeController,
                                  type: TextInputType.text),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        state is JoinGroupLoading
                            ? const Center(child: CircularProgressIndicator())
                            : customButton(
                                text: 'التالي',
                                onTap: () {
                                  cubit.joinGroup(
                                      groupId: groupId, oldUser: founderId);
                                  print(
                                    groupId.toString(),
                                  );
                                  print(founderId.toString());
                                  // if (
                                  //   formKey.currentState!.validate()) {
                                  //   MagicRouter.navigateTo(const AcceptJoinToGroupScreen());
                                  // }
                                },
                                context: context),
                      ]);
                },
              ),
            ),
          ),
        ));
  }
}
