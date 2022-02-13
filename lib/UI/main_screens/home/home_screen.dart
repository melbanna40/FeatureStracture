import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_loader.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/Main/widgets/drawer.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:local_auth/local_auth.dart';

import 'cubit/home_cubit.dart';
import 'widgets/check_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(milliseconds: 800),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeIn,
  // );
  late HomeCubit? cubit;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (mounted) {
      Timer.periodic(
        const Duration(seconds: 30),
        (Timer t) {
          if (cubit != null) cubit!.updateCurrentDateTime();
        },
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit()
          ..updateCurrentDateTime()
          ..getHomeStatistics()
          ..updateCurrentLocation()
          ..getUserDataApiCal();
      },
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        cubit = BlocProvider.of<HomeCubit>(context);
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 85,
              elevation: 0,
              actions: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    children: [
                      Gaps.vGap8,
                      SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                          height: 35, width: 40),
                    ],
                  ),
                ),
              ],
              title: Text(
                'مرحباً ${cubit!.mProfileData != null ? cubit!.mProfileData!.userName! : ''}',
                style: const TextStyle(
                  color: Color(0xff828282),
                  fontSize: 18,
                  fontFamily: 'Dubai',
                  fontWeight: FontWeight.w700,
                ),
              ),
              leadingWidth: 65,
              leading: InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Row(
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xff0077ff),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: ImageLoader.loadDefaultA(
                            cubit!.mProfileData != null
                                ? cubit!.mProfileData!.image!
                                : 'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png',
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(12),
              child: RefreshIndicator(
                onRefresh: () async {
                  cubit!.getHomeStatistics();
                  cubit!.updateCurrentLocation();
                },
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: Column(
                      children: getHomeWidgets(),
                    ),
                  ),
                ),
              ),
            ),
            drawer: CustomDrawer(cubit!),
          );
        }
      }),
    );
  }

  List<Widget> getHomeWidgets() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                tileMode: TileMode.mirror,
                colors: [
                  Color(0xff0eedff),
                  Color(0xffab74f9),
                ],
              ),
            ),
            child: Center(
              child: Text(
                '${cubit!.currentTime}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: 'Dubai',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Text(
            '${cubit!.currentDate}',
            style: const TextStyle(
              color: Color(0xff828282),
              fontSize: 16,
              fontFamily: 'Dubai',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () async {
            var localAuth = LocalAuthentication();
            bool canCheckBiometrics = await localAuth.isDeviceSupported();

            if (canCheckBiometrics) {
              try {
                bool didAuthenticate = await localAuth.authenticate(
                    biometricOnly: true,
                    // stickyAuth: true,
                    useErrorDialogs: true,
                    localizedReason: S.of(context).add_finger_print);
                if (didAuthenticate) {
                  cubit!.isLogged!
                      ? cubit!.updateClickOnState()
                      // showCustomDialog(context, (bool isOk) {
                      //         if (isOk) {
                      //           cubit!.updateClickOnState(context);
                      //         }
                      //       })
                      : cubit!.updateClickOnState();
                }
              } catch (err) {
                CommonUtils.showToastMessage(err.toString());
              }
            } else {
              CommonUtils.showToastMessage(S.of(context).enable_finger_print);
            }
          },
          child: SvgPicture.asset(ImageUtils.getSVGPath(
              cubit!.isLogged! ? 'ic_clock_out' : 'ic_clock_in')),
        ),
      ),
      Gaps.vGap8,
      Center(
        child: Text(
          S.of(context).please_add_finger_print,
          style: const TextStyle(
            color: Color(0xff707070),
            fontSize: 18,
            fontFamily: 'Dubai',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      Center(
        child: Text(
          cubit!.isLogged! ? S.of(context).clock_out : S.of(context).clock_in,
          style: const TextStyle(
            color: Color(0xff0077ff),
            fontSize: 26,
            fontFamily: 'Dubai',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Center(
        child: Text(
          'في ${cubit!.mProfileData?.companyName ?? ''}',
          style: const TextStyle(
            color: Color(0xff0077ff),
            fontSize: 18,
            fontFamily: 'Dubai',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Gaps.vGap8,
      Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  cubit!.currentLocation ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff7b7b7b),
                    fontSize: 10,
                    fontFamily: 'Dubai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                cubit!.updateCurrentLocation();
              },
              child: const Icon(
                (CupertinoIcons.location_solid),
              ),
            ),
          ],
        ),
      ),
      Gaps.vGap16,
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          homeWorkingHoursWidget(
              context,
              'ic_clock_in_timer',
              cubit!.mHomeStatisticsData?.clockIn ?? '00:00',
              S.of(context).clock_in,
              const Color(0xffdcf8ff),
              const Color(0xff0077ff)),
          homeWorkingHoursWidget(
              context,
              'ic_clock_out_timer',
              cubit!.mHomeStatisticsData?.clockOut ?? '00:00',
              S.of(context).clock_out,
              const Color(0xffffe8f8),
              const Color(0xffab74f9)),
          homeWorkingHoursWidget(
              context,
              'ic_working_hours_timer',
              cubit!.mHomeStatisticsData?.hoursPerDay ?? '00:00',
              S.of(context).working_hours,
              const Color(0xffe9e9e9),
              const Color(0xff707070)),
        ],
      ),
    ];
  }

  void showCustomDialog(BuildContext context, Function(bool) callback) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return CheckDialog(
          callback: callback,
          cubit: cubit,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  Widget homeWorkingHoursWidget(BuildContext context, String imgPath,
      String time, String state, Color currentColor, Color currentTextColor) {
    return Container(
      decoration: BoxDecoration(
        color: currentColor,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 90,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SvgPicture.asset(
            ImageUtils.getSVGPath(imgPath),
            height: 30,
            width: 30,
          ),
          Text(
            time.isNotEmpty ? time : '00:00',
            style: TextStyle(
              color: currentTextColor,
              fontSize: 11,
              fontFamily: 'Dubai',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            state,
            style: TextStyle(
              color: currentTextColor,
              fontSize: 11,
              fontFamily: 'Dubai',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
