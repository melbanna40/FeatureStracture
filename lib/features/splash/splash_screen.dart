import 'dart:async';
import 'package:flutter/material.dart';

import '../../animation/slide_in.dart';
import '../../res/strings.dart';
import '../../widgets/page_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _startMovingUp = false;
  Future initData() async => await Future.delayed(const Duration(seconds: 3));

  Future<void> _checkShowingIntro() async {
    // bool showIntro =
    //     await SharedPreferencesFormatter.getBoolean("show_intro", true);
    // if (showIntro) {
    //   SharedPreferencesFormatter.saveBoolean("show_intro", false);
    //   Navigator.pushReplacementNamed(context, introRoute);
    // } else {
    Navigator.pushReplacementNamed(context, loginRoute);
    // }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, authScreen));
  }

  Widget _buildBodyItem() {
    return Center(
      child: Image.asset(
        'assets/images/splash.gif',
        height: 400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: _buildBodyItem(),
    ));
  }
}
