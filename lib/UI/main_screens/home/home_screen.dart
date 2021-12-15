import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/CommonUtils/log_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:local_auth/local_auth.dart';

import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localAuth = LocalAuthentication();

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final cubit = BlocProvider.of<HomeCubit>(context);
      if (state is HomeLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is HomeSuccess) {
        return Scaffold(
          backgroundColor: MColors.colorPrimary.withOpacity(0.5),
          body: Container(),
        );
      } else {
        return Scaffold(
          backgroundColor: MColors.colorPrimary.withOpacity(0.5),
          body: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${S
                        .of(context)
                        .appName}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Gaps.vGap30,
                  Column(
                    children: [
                      Text(
                        '${cubit.currentTime}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${cubit.currentDate}',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      var localAuth = LocalAuthentication();
                      bool didAuthenticate =
                      await localAuth.authenticate(
                          localizedReason: 'Please authenticate to show account balance');

                      List<BiometricType> availableBiometrics =
                      await localAuth.getAvailableBiometrics();

                      if (Platform.isIOS) {
                        if (availableBiometrics.contains(BiometricType.face)) {
                          // Face ID.
                          Log.e('Face ID');
                        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
                          // Touch ID.
                          Log.e('Touch ID');
                        }
                      }
                      // final result = await localAuth.authenticate(
                      //   localizedReason:
                      //   'Please verify to login without credentials',
                      //   biometricOnly: true,
                      // );
                      // if (result) {
                      //   cubit.updateClickOnState();
                      // }
                    },
                    child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          tileMode: TileMode.mirror,
                          colors: [
                            Colors.lightBlue,
                            Colors.deepPurpleAccent,
                          ],
                        ), // inner circle color
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2), // border width
                        child: Container(
                          // or ClipRRect if you need to clip the content

                          child: Column(
                            children: [
                              SvgPicture.asset(
                                ImageUtils.getSVGPath('ic_hand_up'),
                                width: 80,
                                height: 80,
                              ),
                              Text(
                                cubit.isLogged! ? S
                                    .of(context)
                                    .clock_out : S
                                    .of(context)
                                    .clock_in,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ), // inner content
                        ),
                      ),
                    ),
                  ),
                  Gaps.vGap30,
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Shebin elkom, menufia egypt'),
                        Icon(
                          (CupertinoIcons.location_solid),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      homeWorkingHoursWidget(context, 'ic_clock_in', '8:15 AM',
                          S
                              .of(context)
                              .clock_in),
                      homeWorkingHoursWidget(context, 'ic_clock_out', '4:30 PM',
                          S
                              .of(context)
                              .clock_out),
                      homeWorkingHoursWidget(context, 'ic_clock_total',
                          '8:15 Hr\'s', S
                              .of(context)
                              .working_hours),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  Widget homeWorkingHoursWidget(BuildContext context, String imgPath,
      String time, String state) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            ImageUtils.getImagePath(imgPath),
            height: 30,
            width: 30,
          ),
          Text(time),
          Text(state),
        ],
      ),
    );
  }
}
