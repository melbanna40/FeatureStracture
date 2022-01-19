import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
      final cubit = BlocProvider.of<NotificationsCubit>(context);
      if (state is NotificationsLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (cubit.mNotificationDataList == null ||
          cubit.mNotificationDataList!.isEmpty) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).empty_data),
                Gaps.vGap16,
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: MColors.colorPrimarySwatch,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(8), right: Radius.circular(8))),
                  child: MaterialButton(
                      child: Text(
                        S.of(context).refresh,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        _onRefresh(cubit);
                      }),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
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
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14)),
                            color: index == 0 || index % 2 == 0
                                ? MColors.colorPrimarySwatch.withOpacity(.2)
                                : Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(14)),
                                          color: Colors.blue[200]),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(14)),
                                          child: Image.asset(
                                              ImageUtils.getImagePath(
                                                  'ic_kafey_logo')))),
                                ],
                              ),
                              Gaps.hGap8,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.mNotificationDataList![index]
                                        .notification!.title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    cubit.mNotificationDataList![index]
                                        .notification!.body!,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("11:44 "),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        );
      }
    });
  }

  Future<void> _onRefresh(NotificationsCubit cubit) async {
    cubit.getNotificationsHistoryApiCal();
  }
}
