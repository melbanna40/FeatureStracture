import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularPercentIndicator(
                  radius: 200,
                  lineWidth: 10,
                  // arcType: ArcType.FULL,
                  percent: .75,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  // arcBackgroundColor:
                  // MColors.colorPrimarySwatch.withOpacity(.2),
                  progressColor: MColors.colorPrimarySwatch.withOpacity(.8),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "05",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Leave Balance",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Click apply to leave",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Row(
                children: [Row(
                  children: [
                    Text("total leaves"),
                    Gaps.hGap8,
                    CircleAvatar(
                      radius: 3,
                    ),
                  ],
                ),
                  Spacer(),
                  Row(
                    children: [

                      Text("leaves used"),
                      Gaps.hGap8,
                      CircleAvatar(
                        radius: 3,
                      ),
                    ],
                  )],
              ),
              Row(
                children: [
                  Gaps.hGap8,
                  Text(
                    "20",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  Text(
                    "15",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Gaps.hGap8,
                ],
              ),
              Gaps.vGap30,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 5,
                          // arcType: ArcType.FULL,
                          percent: .75,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          // arcBackgroundColor:
                          // MColors.colorPrimarySwatch.withOpacity(.2),
                          progressColor:
                              MColors.colorPrimarySwatch.withOpacity(.8),
                          center: Text("2"),
                        ),
                        Text(
                          "Casual leave",
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 5,
                          // arcType: ArcType.FULL,
                          percent: .75,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          // arcBackgroundColor:
                          // MColors.colorPrimarySwatch.withOpacity(.2),
                          progressColor: Colors.orange.withOpacity(.8),
                          center: Text("2"),
                        ),
                        Text(
                          "Medical leave",
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 5,
                          // arcType: ArcType.FULL,
                          percent: .75,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          // arcBackgroundColor:
                          // MColors.colorPrimarySwatch.withOpacity(.2),
                          progressColor: Colors.green.withOpacity(.8),
                          center: Text("2"),
                        ),
                        Text(
                          "Annual leave",
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 5,
                          // arcType: ArcType.FULL,
                          percent: 0,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          // arcBackgroundColor:
                          // MColors.colorPrimarySwatch.withOpacity(.2),
                          progressColor:
                              MColors.colorPrimarySwatch.withOpacity(.8),
                          center: Text("0"),
                        ),
                        Text(
                          "Other leave ",
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gaps.vGap40,
              Row(
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: MColors.colorPrimarySwatch,
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(8),
                            right: Radius.circular(8))),
                    child: MaterialButton(
                        child: Text(
                          "Approvals",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {}),
                  ),
                  Spacer(),
                  Text("Leaves History",
                      style: TextStyle(
                        color: Colors.grey,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
