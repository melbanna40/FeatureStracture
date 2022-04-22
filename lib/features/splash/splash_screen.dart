import 'dart:async';

import 'package:byaan/features/temp/presentation/ui/temp_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/page_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 5), () => Get.to(() => const TempScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset(
              'assets/images/splash.gif',
              height: 400,
            ),
          ),
        ));
  }
}
