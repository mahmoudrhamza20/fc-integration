import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/terms_cubit/cubit/terms_cubit.dart';
import 'package:shared/screens/add_request_to_create_group.dart';
import 'package:shared/widgets/custom_button.dart';

import '../core/utils/parse_html.dart';

class SecondPrivacyScreen extends StatelessWidget {
  const SecondPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TermsCubit()..getTerms(),
        child: SafeArea(
          child: BlocBuilder<TermsCubit, TermsState>(
            builder: (context, state) {
              final cubit = TermsCubit.of(context);
              return Column(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 200,
                      color: BrandColors.primary,
                    ),
                  ),
                  Text("شروط وأحكام المجموعة",
                      style: TextStyle(
                          color: BrandColors.primary, fontSize: 16.sp)),
                  state is TermsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              textAlign: TextAlign.center,
                              parseHtmlString(cubit.termsData!.terms),
                              style: TextStyle(fontSize: 14.sp)),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: customButton(
                        text: 'موافق',
                        onTap: () {
                          MagicRouter.navigateTo(
                              const AddRequestToCreateGroupScreen());
                        },
                        context: context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
