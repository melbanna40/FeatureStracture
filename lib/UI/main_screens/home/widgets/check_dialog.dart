import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';

import '../cubit/home_cubit.dart';

class CheckDialog extends StatefulWidget {
  final Function(bool)? callback;

  final HomeCubit? cubit;

  const CheckDialog({Key? key, this.callback, this.cubit}) : super(key: key);

  @override
  _CheckDialogState createState() => _CheckDialogState();
}

class _CheckDialogState extends State<CheckDialog> {
  String? pickedTime;
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        child: Form(
          child: Container(
              // padding: const EdgeInsets.all(8),
              child: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color: Colors.transparent.withOpacity(.2),
                child: Container(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageUtils.getSVGPath('bg_dialog'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '" لم يحن موعد الرحيل بعد"',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Text(
                          'هل أنت متأكد من \n ${widget.cubit!.isLogged! ? S.of(context).clock_out : S.of(context).clock_in}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gaps.vGap8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                widget.callback!.call(true);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'نعم',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // callback.call(false);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    'لا',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ),
          )),
        ),
      ),
    );
  }

  String getTimeFormat(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
