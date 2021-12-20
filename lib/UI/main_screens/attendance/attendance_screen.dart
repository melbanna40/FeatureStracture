import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class AttendanceScreen extends StatelessWidget {
   AttendanceScreen({Key? key}) : super(key: key);
  List<DataRow> dataRowList =[];


  @override
  Widget build(BuildContext context) {
    for (int i=0 ; i<40;i++){
      dataRowList.add(  DataRow(cells: [
        DataCell(Card(
          // clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12.0, vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "11",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "TUE",
                  style: TextStyle(
                      fontSize: 8, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )),
        DataCell(Row(
          children: [
            Icon(CupertinoIcons.arrow_down_left,
                size: 12,
                color: Colors.green),
            Text("09:00PM",
                style: TextStyle(color: Colors.green,
                    fontSize: 12
                )),
          ],
        )),
        DataCell(Row(
          children: [
            Icon(CupertinoIcons.arrow_down_left,
              size: 12,
            ),
            Text("09:00PM",
                style: TextStyle(
                    fontSize: 12
                )),
          ],
        )),
        DataCell(Row(
          children: [
            Icon(CupertinoIcons.arrow_down_left,
                size: 12,
                color: Colors.red),
            Text("07h:30m",
                style: TextStyle(color: Colors.red,
                    fontSize: 12
                )),
            Spacer(),
            Icon(Icons.arrow_back_ios_new_rounded,size: 12,)
          ],
        )),
      ]),);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          S.of(context).attendance,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
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
                  Icon(CupertinoIcons.calendar, color: MColors.colorPrimary),
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
                      columnSpacing: 30,
                      horizontalMargin: 12,
                      dataRowHeight: 50,
                      // headingRowColor: Colors.grey,
                      columns: [
                        DataColumn(label: Text(S.of(context).sDate)),
                        DataColumn(label: Text(S.of(context).Clock_in)),
                        DataColumn(label: Text(S.of(context).Clock_out)),
                        DataColumn(label: Text(S.of(context).Working_Hr)),
                      ],
                      rows:dataRowList

                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}