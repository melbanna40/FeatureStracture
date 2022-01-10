import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/UI/main_screens/attendance/cubit/attendance_cubit.dart';
import 'package:kafey/UI/main_screens/attendance/widget/clock_out_dialog.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/network/api/ApiResponse/attendance_history_response.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

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
      if (state is AttendanceLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        dataRowList.clear();
        for (AttendanceHistoryData item in cubit.mAttendanceHistoryDataList!) {
          dataRowList.add(
            DataRow(cells: [
              DataCell(Card(
                // clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "11",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "TUE",
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )),
              DataCell(Row(
                children: [
                  Icon(CupertinoIcons.arrow_down_left,
                      size: 12, color: Colors.green),
                  Text(item.clockIn!,
                      style: TextStyle(color: Colors.green, fontSize: 12)),
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
                            return ClockOutDialog();
                          });
                    },
                    child: Container(
                      child: Text(item.clockOut!, style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              )),
              DataCell(Row(
                children: [
                  Icon(CupertinoIcons.arrow_down_left, size: 12, color: Colors.red),
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "December 2019",
                        style: TextStyle(color: MColors.colorPrimary),
                      ),
                      Gaps.hGap4,
                      Icon(CupertinoIcons.calendar,
                          color: MColors.colorPrimary),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey[50],
                        height: 57,
                      ),
                      DataTable(

                          // columnSpacing: 20,
                          columnSpacing: 40,
                          horizontalMargin: 12,
                          dataRowHeight: 50,
                          // headingRowColor: Colors.grey,
                          columns: [
                            DataColumn(
                              label: Text(
                                S.of(context).sDate,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                S.of(context).Clock_in,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                S.of(context).Clock_out,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                S.of(context).Working_Hr,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                          rows: dataRowList),
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
}
