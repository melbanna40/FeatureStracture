import 'package:dev_banna/CommonUtils/log_utils.dart';
import 'package:dev_banna/features/temp/cubit/temp_cubit.dart';
import 'package:dev_banna/features/temp/ui/temp_screen.dart';
import 'package:dev_banna/res/m_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Helpers/hivr_helper.dart';
import 'dependencies/dependency_init.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Log.i("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // await Firebase.initializeApp();

  await Hive.initFlutter();

  await Hive.openBox(HiveHelper.keyBoxAppLanguage);
  await Hive.openBox(HiveHelper.boxKeyLoginResponse);
  await Hive.openBox(HiveHelper.boxKeyUserToken);
  await Hive.openBox(HiveHelper.keyAppBaseUrl);

  // FirebaseMessaging.instance
  //     .requestPermission(alert: true, badge: true, sound: true);
  // FirebaseMessaging.instance.getToken().then((token) {
  //   assert(token != null);
  //   // print(token);
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
          contentPadding: const EdgeInsets.all(8.0),
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
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide:
                  BorderSide(color: MColors.colorPrimarySwatch, width: 1)),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: MColors.colorPrimarySwatch,
              width: 1.5,
            ),
          ),
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          labelStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MColors.colorPrimarySwatch,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        primarySwatch: MColors.colorPrimarySwatch,
        fontFamily: "Dubai",
        primaryColor: MColors.colorPrimary);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mThemeData,
      locale: Hive.box(HiveHelper.keyBoxAppLanguage).isNotEmpty
          ? Locale(Hive.box(HiveHelper.keyBoxAppLanguage)
              .get(HiveHelper.keyBoxAppLanguage.toString()))
          : const Locale("ar"),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: BlocProvider(
        create: (context) => getIt<TempCubit>()..getTempData(),
        child: const TempScreen(),
      ),
    );
  }
}
