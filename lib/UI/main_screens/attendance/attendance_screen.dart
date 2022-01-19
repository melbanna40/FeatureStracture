import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kafey/UI/main_screens/attendance/cubit/attendance_cubit.dart';
import 'package:kafey/UI/main_screens/attendance/widget/clock_out_dialog.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/network/api/ApiResponse/attendance_history_response.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<DataRow> dataRowList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
      final cubit = BlocProvider.of<AttendanceCubit>(context);
      if (state is AttendanceLoading ||
          cubit.mAttendanceHistoryDataList == null) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        dataRowList.clear();
        if (cubit.mAttendanceHistoryDataList != null)
          for (AttendanceHistoryData item
              in cubit.mAttendanceHistoryDataList!) {
            dataRowList.add(
              DataRow(cells: [
                DataCell(Card(
                  // clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.dayOfMonth!.toString(),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 24,
                          child: Text(
                            item.dayOfWeek!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                DataCell(Row(
                  children: [
                    Icon(CupertinoIcons.arrow_down_left,
                        size: 12, color: Colors.green),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ClockOutDialog(
                                onCreateClickedCallBack:
                                    (Map<String, dynamic> data) {
                                  data.addAll({
                                    'type': '1',
                                  });
                                  cubit.updateAttendanceRequestApiCall(
                                      context, item.id!.toString(), data);
                                },
                              );
                            });
                      },
                      child: Text(item.clockIn!,
                          style: TextStyle(color: Colors.green, fontSize: 12)),
                    ),
                  ],
                )),
                DataCell(Row(
                  children: [
                    Icon(
                      CupertinoIcons.arrow_down_left,
                      size: 12,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ClockOutDialog(
                                onCreateClickedCallBack:
                                    (Map<String, dynamic> data) {
                                  data.addAll({
                                    'type': '2',
                                  });
                                  cubit.updateAttendanceRequestApiCall(
                                      context, item.id!.toString(), data);
                                },
                              );
                            });
                      },
                      child: Container(
                        child: Text(item.clockOut ?? '',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                )),
                DataCell(Row(
                  children: [
                    Icon(CupertinoIcons.arrow_down_left,
                        size: 12, color: Colors.red),
                    Text(item.hoursPerDay!,
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                    Spacer(),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 12,
                    )
                  ],
                )),
              ]),
            );
          }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: RefreshIndicator(
              onRefresh: () async {
                await cubit.getAttendanceHistoryApiCal();
              },
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                    child: Text(
                      'المواظبة',
                      style: TextStyle(
                        color: Color(0xff0077ff),
                        fontSize: 32,
                        fontFamily: 'Dubai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      DateTime initialDate = DateTime.now();

                      final DateTime? selected = await showMonthPicker(
                        context: context,
                        firstDate: DateTime(initialDate.year - 1, 5),
                        lastDate: DateTime(initialDate.year + 1, 9),
                        initialDate: initialDate,
                      );
                      cubit.updateAttendanceDate(selected!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff0995f5),
                        ),
                        Text(
                          DateFormat.yMMMM('ar').format(cubit.attendanceDay!),
                          style: TextStyle(
                            color: Color(0xff0995f5),
                            fontSize: 20,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff0995f5),
                        ),
                      ],
                    ),
                  ),
                  cubit.mAttendanceHistoryDataList != null &&
                          cubit.mAttendanceHistoryDataList!.isNotEmpty
                      ? Container(
                          height: 200,
                          child: ListView.builder(
                              itemCount:
                                  cubit.mAttendanceHistoryDataList!.length,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      // Get.to(MessagesScreen());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(14)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Color(0xffe5e5e5),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  cubit
                                                      .mAttendanceHistoryDataList![
                                                          index]
                                                      .dayOfMonth!
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  width: 24,
                                                  child: Text(
                                                    cubit
                                                        .mAttendanceHistoryDataList![
                                                            index]
                                                        .dayOfWeek!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(4),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff00c950),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'الحضور ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        '10:01',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(4),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffff3434),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'الانصراف ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        '10:01',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(4),
                                                  padding: EdgeInsets.all(4),
                                                  height: 25,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'ساعات العمل ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff828282),
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        '07:05',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff828282),
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(4),
                                                  padding: EdgeInsets.all(4),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'الحاله ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff828282),
                                                          fontSize: 11,
                                                          fontFamily: 'Dubai',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6,
                                                                horizontal: 12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffffaa00),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        child: Text(
                                                          'حاضر',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                            fontFamily: 'Dubai',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                        )
                      // Stack(
                      //         children: [
                      //           Container(
                      //             color: Colors.grey[50],
                      //             height: 57,
                      //           ),
                      //           DataTable(
                      //               // columnSpacing: 20,
                      //               columnSpacing: 20,
                      //               horizontalMargin: 12,
                      //               dataRowHeight: 50,
                      //               dataTextStyle:
                      //                   TextStyle(overflow: TextOverflow.ellipsis),
                      //               // headingRowColor: Colors.grey,
                      //               columns: [
                      //                 DataColumn(
                      //                   label: Text(
                      //                     S.of(context).sDate,
                      //                     style: TextStyle(fontSize: 12),
                      //                   ),
                      //                 ),
                      //                 DataColumn(
                      //                   label: Text(
                      //                     S.of(context).Clock_in,
                      //                     style: TextStyle(fontSize: 12),
                      //                   ),
                      //                 ),
                      //                 DataColumn(
                      //                   label: Text(
                      //                     S.of(context).Clock_out,
                      //                     style: TextStyle(fontSize: 12),
                      //                   ),
                      //                 ),
                      //                 DataColumn(
                      //                   label: Text(
                      //                     S.of(context).Working_Hr,
                      //                     overflow: TextOverflow.ellipsis,
                      //                     style: TextStyle(fontSize: 12),
                      //                   ),
                      //                 ),
                      //               ],
                      //               rows: dataRowList),
                      //         ],
                      //       )
                      : Center(
                          child: Text(S.of(context).empty_data),
                        )
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
