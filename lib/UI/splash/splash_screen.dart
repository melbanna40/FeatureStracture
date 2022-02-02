import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/main_screen.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/res/gaps.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )
    ..repeat(reverse: true, period: const Duration(milliseconds: 800));
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(
          seconds: 5,
        ), (timer) {
      if (HiveHelper
          .getUserToken()
          .isNotEmpty) {
        Get.offAll(() => MainScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: SvgPicture.asset(ImageUtils.getSVGPath('ic_clock_in')),
            ),
          ),
          Gaps.vGap100,
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                children: [
                  Gaps.vGap8,
                  SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                      height: 35, width: 40),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
      // Lottie.asset(
      //   'assets/lottie/splash_lottie.json',
      //   controller: _controller,
      //   height: MediaQuery.of(context).size.height * 1,
      //   animate: true,
      //   onLoaded: (composition) {
      //     _controller!
      //       ..duration = composition.duration
      //       ..forward().whenComplete(() {
      //         if (HiveHelper.getUserToken().isNotEmpty) {
      //           Get.offAll(() => MainScreen());
      //         } else {
      //           Get.offAll(() => LoginScreen());
      //         }
      //       });
      //   },
      // ),
    );
  }
}
