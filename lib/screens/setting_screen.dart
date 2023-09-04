import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/magic_router.dart';
import 'package:shared/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:shared/screens/faqs_screen.dart';
import 'package:shared/screens/social_media_screen.dart';
import 'package:shared/widgets/profile_menu.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // late String dropdownvalue;

  // final List<Widget> items = [
  //   const ContactUsSocialIcon(
  //     image: AppAssets.face,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.insta2,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.tiktok,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.youtube,
  //     link: '',
  //   ),
  //   const ContactUsSocialIcon(
  //     image: AppAssets.snap,
  //     link: '',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BrandColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                      "الأعدادات",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            ProfileMenu(
              text: "تغير اللغة",
              press: () => {},
            ),
            ProfileMenu(
              text: "تغير كلمة السر",
              press: () {},
            ),
            ProfileMenu(
              text: "خدمة العملاء والدعم الفني",
              press: () {},
            ),
            ProfileMenu(
              text: "وسائل التواصل الاجتماعي",
              press: () => MagicRouter.navigateTo(const SocialMediacreen()),
              // press: () {
              //   PopupMenuButton<String>(
              //     itemBuilder: (BuildContext context) {
              //       return items
              //           .map(
              //             (Widget value) => PopupMenuItem<String>(
              //               child: value,
              //             ),
              //           )
              //           .toList();
              //     },
              //   );
              // },
            ),
            ProfileMenu(
              text: "الاستفسارات",
              press: () => MagicRouter.navigateTo(const FAQsScreen()),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                final cubit = LoginCubit.of(context);
                return state is LogoutLoading
                    ? const Center(child: CircularProgressIndicator())
                    : TextButton(
                        onPressed: () => cubit.logout(),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("تسجيل الخروج"),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
