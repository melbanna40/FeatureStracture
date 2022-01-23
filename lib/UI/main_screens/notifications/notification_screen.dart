import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "الاشعارات",
          style: KStyles.textStyle30,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: [
                SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                    height: 50, width: 60),
                Gaps.vGap4,
                SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_name"),
                    height: 20, width: 20),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
        final cubit = BlocProvider.of<NotificationsCubit>(context);
        if (state is NotificationsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (cubit.mNotificationDataList == null ||
            cubit.mNotificationDataList!.isEmpty) {
          return Center(
            child: Container(
              child: Text('عذراً لا توجد بيانات'),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                _onRefresh(cubit);
              },
              child: ListView.builder(
                itemCount: cubit.mNotificationDataList!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Get.to(MessagesScreen());
                  },
                  child: Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 4,
                        ),
                        Gaps.hGap4,
                        Text(
                          cubit.mNotificationDataList![index].notification!
                              .body!,
                          style: KStyles.textStyle13,
                        ),
                        Spacer(),
                        Chip(
                            elevation: 2,
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            )),
                            backgroundColor: index.remainder(2) == 0
                                ? Colors.green.withOpacity(.3)
                                : Colors.red.withOpacity(.3),
                            label: Container(
                              width: 60,
                              child: Center(
                                child: Text(
                                  cubit.mNotificationDataList![index]
                                      .notification!.body!,
                                  style: TextStyle(
                                    color: index.remainder(2) == 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _onRefresh(NotificationsCubit cubit) async {
    cubit.getNotificationsHistoryApiCal();
  }
}
