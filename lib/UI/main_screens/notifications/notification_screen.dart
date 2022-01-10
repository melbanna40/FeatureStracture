import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/notifications/cubit/notification_cubit.dart';
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
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async{},
              child: ListView.builder(
                  itemCount: 10,
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
                                children: const [
                                  Text(
                                    "احمد خالد",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "طلب اجازه اعتياديه ",
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
}
