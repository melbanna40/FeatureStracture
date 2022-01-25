import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/home/cubit/home_cubit.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

class RequestDetails extends StatefulWidget {
  final Function(bool)? callback;
  final NotificationsCubit cubit;
  final int index;

  const RequestDetails(
      {Key? key, this.callback, required this.cubit, required this.index})
      : super(key: key);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
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
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
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
                        height: 350,
                        width: 200,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check,size:80,color: Colors.white,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("نوع الأجازة:  ",style: KStyles.texBlackBold),
                                  Text("تبدأ الأجازة من :  ",style: KStyles.texBlackBold),
                                  Text("تنتهي الأجازة يوم :  ",style: KStyles.texBlackBold),
                                  Text("سبب الأجازة هو:  ",style: KStyles.texBlackBold),
                                  Text("معلومات اضافية:  ",style: KStyles.texBlackBold),
                                  // Text(widget.cubit.mNotificationDataList![widget.index]
                                  //     .details!.leaveType!.name!,style: KStyles.textWhiteStyle14,
                                  //     )
                                ],
                              ),
                              Gaps.hGap20,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(widget.cubit.mNotificationDataList![widget.index]
                                      .details!.leaveType!.name!,style: KStyles.textWhiteStyle14,
                                      ),
                                  Text(widget.cubit.mNotificationDataList![widget.index]
                                      .details!.from,style: KStyles.textWhiteStyle14,
                                      ),
                                  Text(widget.cubit.mNotificationDataList![widget.index]
                                      .details!.to,style: KStyles.textWhiteStyle14,
                                  ),
                                  Text(widget.cubit.mNotificationDataList![widget.index]
                                      .details!.reason,style: KStyles.textWhiteStyle14,
                                  ),
                                  Text(widget.cubit.mNotificationDataList![widget.index]
                                      .details!.comment??"",style: KStyles.textWhiteStyle14,
                                  )
                                ],
                              ),




                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            )),
          ),
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
