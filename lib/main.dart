import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kafey/UI/main_screens/home/cubit/home_cubit.dart';
import 'package:kafey/res/m_colors.dart';

import 'Helpers/hivr_helper.dart';
import 'UI/User/login/cubit/login_cubit.dart';
import 'UI/User/verify_code/cubit/verify_code_cubit.dart';
import 'UI/splash/splash_screen.dart';
import 'dependencies/dependency_init.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();

  await Hive.openBox(HiveHelper.KEY_BOX_APP_LANGUAGE);
  await Hive.openBox(HiveHelper.KEY_BOX_LOGIN_RESPONSE);
  await Hive.openBox(HiveHelper.KEY_BOX_USER_RESPONSE);
  await Hive.openBox(HiveHelper.KEY_BOX_TOKEN);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData mThemeData = ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          focusColor: Colors.white,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8.0),
          // constraints: const BoxConstraints(
          //   minHeight: 30,
          //   maxHeight: 40,
          // ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: Colors.red, width: 1)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: Colors.red, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide:
                  BorderSide(color: MColors.colorPrimarySwatch, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              )),
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          labelStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        primarySwatch: MColors.colorPrimarySwatch,
        fontFamily: "Dubai",
        primaryColor: MColors.colorPrimary);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => VerifyCodeCubit()),
          BlocProvider(
              create: (context) => HomeCubit()..updateCurrentDateTime()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: mThemeData,
          locale: Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).isNotEmpty
              ? Locale(Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE)
                  .get(HiveHelper.KEY_BOX_APP_LANGUAGE.toString()))
              : const Locale("ar"),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: SplashScreen(),
        ));
  }
}
