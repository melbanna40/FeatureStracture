import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/image_loader.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/widgets/drawer.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:local_auth/local_auth.dart';

import 'cubit/home_cubit.dart';
import 'widgets/check_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? mAnimationController;
  Animation<double>? animation;
  late HomeCubit? cubit;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (mounted)
      Timer.periodic(Duration(seconds: 30), (Timer t) {
        if (cubit != null) cubit!.updateCurrentDateTime();
      });
    mAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        microseconds: 500,
      ),
    );
    animation =
        Tween<double>(begin: 85, end: 220).animate(mAnimationController!)
          ..addListener(() {
            setState(() {});
          });
    mAnimationController!.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      cubit = BlocProvider.of<HomeCubit>(context);
      if (state is HomeLoading) {
        return Center(child: CircularProgressIndicator());
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
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              'مرحباً ${HiveHelper.getUserData?.user?.name ?? ''}',
              style: TextStyle(
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
                    margin: EdgeInsets.only(right: 16),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xff0077ff),
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: ImageLoader.loadDefaultA(
                          'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png',
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
            padding: EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                cubit!.getHomeStatistics();
                cubit!.updateCurrentLocation();
              },
              child: Center(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Gaps.hGap16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
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
                                  style: TextStyle(
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
                              style: TextStyle(
                                color: Color(0xff828282),
                                fontSize: 16,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: InkWell(
                            onTap: () async {
                              var localAuth = LocalAuthentication();

                              bool didAuthenticate =
                                  await localAuth.authenticate(
                                      biometricOnly: true,
                                      stickyAuth: true,
                                      localizedReason:
                                          'ضع بصمتك لاتمام العمليه');

                              if (didAuthenticate) {
                                cubit!.isLogged!
                                    ? showCustomDialog(context, (bool isOk) {
                                        if (isOk) {
                                          cubit!.updateClickOnState();
                                        }
                                      })
                                    : cubit!.updateClickOnState();
                              }
                            },
                            child: SvgPicture.asset(ImageUtils.getSVGPath(
                                cubit!.isLogged!
                                    ? 'ic_clock_out'
                                    : 'ic_clock_in')),
                          ),
                        ),
                        Gaps.vGap8,
                        Center(
                          child: Text(
                            'من فضلك أدخل بصمتك',
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 18,
                              fontFamily: 'Dubai',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            cubit!.isLogged!
                                ? S.of(context).clock_out
                                : S.of(context).clock_in,
                            style: TextStyle(
                              color: Color(0xff0077ff),
                              fontSize: 26,
                              fontFamily: 'Dubai',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'في مؤسسة أُفُق',
                            style: TextStyle(
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
                              Container(
                                width: 200,
                                child: Text(
                                  cubit!.currentLocation ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff7b7b7b),
                                    fontSize: 10,
                                    fontFamily: 'Dubai',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Icon(
                                (CupertinoIcons.location_solid),
                              ),
                            ],
                          ),
                        ),
                        Gaps.vGap16,
                      ],
                    ),
                    Gaps.vGap8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        homeWorkingHoursWidget(
                            context,
                            'ic_clock_in_timer',
                            cubit!.mHomeStatisticsData?.clockIn ?? '00:00',
                            S.of(context).clock_in,
                            Color(0xffdcf8ff),
                            Color(0xff0077ff)),
                        homeWorkingHoursWidget(
                            context,
                            'ic_clock_out_timer',
                            cubit!.mHomeStatisticsData?.clockOut ?? '00:00',
                            S.of(context).clock_out,
                            Color(0xffffe8f8),
                            Color(0xffab74f9)),
                        homeWorkingHoursWidget(
                            context,
                            'ic_working_hours_timer',
                            cubit!.mHomeStatisticsData?.hoursPerDay ?? '00:00',
                            S.of(context).working_hours,
                            Color(0xffe9e9e9),
                            Color(0xff707070)),
                      ],
                    ),
                    Gaps.vGap50
                  ],
                ),
              ),
            ),
          ),
          drawer: CustomDrawer(cubit!),
        );
      }
    });
  }

  void showCustomDialog(BuildContext context, Function(bool) callback) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return CheckDialog(
          callback: callback,
          cubit: cubit,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
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
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(8),
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
