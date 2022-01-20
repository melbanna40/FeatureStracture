import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kafey/UI/User/change_password/cubit/change_password_cubit.dart';
import 'package:kafey/UI/User/forget_password/cubit/forget_password_cubit.dart';
import 'package:kafey/UI/main_screens/attendance/cubit/attendance_cubit.dart';
import 'package:kafey/UI/main_screens/home/cubit/home_cubit.dart';
import 'package:kafey/UI/main_screens/leaves/cubit/leaves_cubit.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
import 'package:kafey/res/m_colors.dart';

import 'Helpers/hivr_helper.dart';
import 'UI/User/login/cubit/login_cubit.dart';
import 'UI/splash/splash_screen.dart';
import 'dependencies/dependency_init.dart';
import 'generated/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  await Hive.openBox(HiveHelper.KEY_BOX_APP_LANGUAGE);
  await Hive.openBox(HiveHelper.KEY_BOX_LOGIN_RESPONSE);
  await Hive.openBox(HiveHelper.KEY_BOX_USER_RESPONSE);
  await Hive.openBox(HiveHelper.KEY_BOX_TOKEN);

  FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);
  FirebaseMessaging.instance.getToken().then((token) {
    assert(token != null);
    print(token);
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
                color: MColors.colorPrimarySwatch,
                width: 1.5,
              )),
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

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => ForgetPasswordCubit()),
          BlocProvider(create: (context) => ChangePasswordCubit()),
          BlocProvider(
              create: (context) =>
                  NotificationsCubit()..getNotificationsHistoryApiCal()),
          BlocProvider(
              create: (context) => LeavesCubit()
                ..getMyLeavesBalances()
                ..getMyLeavesHistory()),
          BlocProvider(
              create: (context) =>
                  AttendanceCubit()..getAttendanceHistoryApiCal()),
          BlocProvider(
              create: (context) => HomeCubit()
                ..updateCurrentDateTime()
                ..getHomeStatistics()
                ..updateCurrentLocation()),
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
            GlobalCupertinoLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          home: SplashScreen(),
        ));
  }
}
