import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared/core/utils/app_storage.dart';
import 'package:shared/cubits/login_cubit/cubit/login_cubit.dart';
import 'package:shared/firebase_options.dart';
import 'package:shared/screens/splash_screen.dart';
import 'package:shared/translations/codegen_loader.g.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/magic_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'cubits/get_governments_countries_cubit/cubit/getgovernmentsandcountries_cubit.dart';
import 'cubits/register_cubit/cubit/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.requestPermission();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await CacheHelper.init();
  await AppStorage.init();

  runApp(EasyLocalization(
      // supportedLocales: const [Locale('ar'), Locale('en')],
      supportedLocales: const [
        Locale(
          'ar',
        )
      ],
      assetLoader: const CodegenLoader(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => GetGovernmentsAndCountriesCubit()
            ..getCountries()
            ..getGovernments(
                countryId: (CacheHelper.getData(key: 'countryId')) ?? 1)
            ..getCities(
                governmentId: CacheHelper.getData(key: 'governmentId') ?? 1),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: const MyCustomSplashScreen(),
            navigatorKey: navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            title: 'Fc',
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
