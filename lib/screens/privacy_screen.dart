import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/terms_cubit/cubit/terms_cubit.dart';
import 'package:shared/screens/home_screen.dart';
import 'package:shared/widgets/custom_button.dart';

import '../core/utils/parse_html.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TermsCubit()..getTerms(),
        child: SafeArea(
          child: BlocBuilder<TermsCubit, TermsState>(
            builder: (context, state) {
              final cubit = TermsCubit.of(context);
              return state is TermsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            height: 200,
                            color: BrandColors.primary,
                            child: const Center(
                                child: Text(
                              "مرحبا بك",
                              style: TextStyle(fontSize: 16),
                            )),
                          ),
                        ),
                        Text("الشروط والأحكام",
                            style: TextStyle(
                                color: BrandColors.primary, fontSize: 16.sp)),
                        Padding(
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Lottie.asset(
                                              "assets/animation/done.json"),
                                          const Text(
                                            'مبروك',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      content: const Text(
                                        'تم تسجيل حسابك بنجاح',
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              MagicRouter.navigateAndPopAll(
                                                  const HomeScreen()),
                                          child: const Text('تم'),
                                        ),
                                      ],
                                    );
                                  },
                                );
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
