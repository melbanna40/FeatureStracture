import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/CommonUtils/log_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/widgets/drawer.dart';
import 'package:kafey/UI/User/login/cubit/login_cubit.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/main_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    LoginCubit().doSaveDeviceToken(HiveHelper.getUserToken());

    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@drawable/splash');

    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    FlutterLocalNotificationsPlugin().initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      displayNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      displayNotification(message);
    });
    FirebaseMessaging.onBackgroundMessage(
        (RemoteMessage message) => displayNotification(message));
    _firebaseMessaging.requestPermission(alert: true, badge: true, sound: true);
    _firebaseMessaging.getToken().then((token) {
      assert(token != null);
      print(token);
    });
  }

  Future<void> displayNotification(RemoteMessage message) async {
    await Firebase.initializeApp();
    Log.i(message.toString());

    await FlutterLocalNotificationsPlugin().show(
      0,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          'channelid', 'flutterfcm',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          // sound: RawResourceAndroidNotificationSound(message.data['sound'])
        ),
        iOS: IOSNotificationDetails(),
      ),
      payload: message.data['title'],
    );
  }

  void onSelectNotification(String? payload) {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title ?? ''),
        content: new Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              // CommonUtils.showToastMessage(title);
            },
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarTitles = [
      Text(
        S.of(context).home,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      // Text(
      //   S.of(context).myTeams,
      //   style: TextStyle(
      //       color: MColors.colorPrimarySwatch,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20),
      // ),
      Text(
        S.of(context).attendance,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).notification,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).more,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    ];
    return BlocProvider(
        create: (BuildContext context) => MainCubit(),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<MainCubit>(context);
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   elevation: 0,
              //   title: appBarTitles[cubit.currentIndex],
              //   centerTitle: true,
              //   leading: InkWell(
              //     onTap: () {
              //       _scaffoldKey.currentState!.openDrawer();
              //     },
              //     child: SvgPicture.asset(
              //       ImageUtils.getSVGPath('ic_logo'),
              //       width: 20,
              //       height: 20,
              //     ),
              //   ),
              // ),
              drawer: CustomDrawer(cubit),
              bottomNavigationBar: CurvedNavigationBar(
                items: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.supervised_user_circle_outlined,
                          color: cubit.currentIndex == 0
                              ? Color(0xff0995f5)
                              : Colors.black,
                        ),
                        Text(
                          'الملف الشخصي',
                          style: TextStyle(
                            color: cubit.currentIndex == 0
                                ? Color(0xff0995f5)
                                : Colors.black,
                            fontSize: 9,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImageUtils.getSVGPath('notification_bell'),
                          color: cubit.currentIndex == 1
                              ? Color(0xff0995f5)
                              : Colors.black,
                        ),
                        Text(
                          'الاشعارات',
                          style: TextStyle(
                            color: cubit.currentIndex == 1
                                ? Color(0xff0995f5)
                                : Colors.black,
                            fontSize: 9,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                                  Color(0xff2ad8fe),
                                  Color(0xff5a7bef),
                                ],
                              )),
                          child: SvgPicture.asset(
                            ImageUtils.getSVGPath('fingerprint'),
                            width: 35,
                            height: 35,
                            color: cubit.currentIndex == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImageUtils.getSVGPath('add_request'),
                          color: cubit.currentIndex == 3
                              ? Color(0xff0995f5)
                              : Colors.black,
                        ),
                        Text(
                          'طلب الاجازه',
                          style: TextStyle(
                            color: cubit.currentIndex == 3
                                ? Color(0xff0995f5)
                                : Colors.black,
                            fontSize: 9,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImageUtils.getSVGPath('time_table'),
                          color: cubit.currentIndex == 4
                              ? Color(0xff0995f5)
                              : Colors.black,
                        ),
                        Text(
                          S.of(context).attendance,
                          style: TextStyle(
                            color: cubit.currentIndex == 4
                                ? Color(0xff0995f5)
                                : Colors.black,
                            fontSize: 9,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                index: 2,
                color: Colors.white,
                buttonBackgroundColor: Colors.transparent,
                backgroundColor: Colors.white,
                animationCurve: Curves.easeOut,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                letIndexChange: (index) => true,
                height: 65.0,
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        ));
  }
}
