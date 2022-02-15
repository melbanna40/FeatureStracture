import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
import 'package:kafey/UI/main_screens/notifications/widget/request_details_dialog.dart';
import 'package:kafey/UI/widgets/empty_data_widget.dart';
import 'package:kafey/UI/widgets/loading_widget.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        centerTitle: true,
        elevation: 0,
        title: Text(
          S.of(context).notification,
          style: KStyles.textStyle30,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: [
                Gaps.vGap8,
                SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                    height: 35, width: 40),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
        final cubit = BlocProvider.of<NotificationsCubit>(context);
        if (state is NotificationsLoading) {
          return const LoadingWidget();
        } else if (cubit.mNotificationDataList == null ||
            cubit.mNotificationDataList!.isEmpty) {
          return EmptyDataWidget(
            onRefreshClicked: () {
              _onRefresh(cubit);
            },
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                _onRefresh(cubit);
              },
              child: ListView.builder(
                itemCount: cubit.mNotificationDataList!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    showCustomDialog(context, (bool isOk) {
                      if (isOk) {}
                    }, cubit, index);
                  },
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 4,
                      ),
                      Gaps.hGap4,
                      Text(
                        cubit.mNotificationDataList![index].details!.body ??
                            cubit.mNotificationDataList![index].details!
                                .leaveType!.name,
                        style: KStyles.textStyle13,
                      ),
                      const Spacer(),
                      Chip(
                        elevation: 2,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        backgroundColor: (cubit.mNotificationDataList![index]
                                    .details!.status ==
                                '2')
                            ? Colors.green.withOpacity(.3)
                            : Colors.red.withOpacity(.3),
                        label: SizedBox(
                          width: 60,
                          child: Center(
                            child: Text(
                              cubit.mNotificationDataList![index].details!
                                      .notificationStatus ??
                                  '',
                              style: TextStyle(
                                color: (cubit.mNotificationDataList![index]
                                            .details!.status ==
                                        '2')
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  void showCustomDialog(BuildContext context, Function(bool) callback,
      NotificationsCubit cubit, int index) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return RequestDetails(
          callback: callback,
          cubit: cubit,
          index: index,
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

  Future<void> _onRefresh(NotificationsCubit cubit) async {
    cubit.getNotificationsHistoryApiCal();
  }
}
