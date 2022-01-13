import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kafey/UI/main_screens/leaves/cubit/leaves_cubit.dart';
import 'package:kafey/UI/main_screens/leaves/widgets/apply_leave_dialog.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LeavesScreen extends StatelessWidget {
  const LeavesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeavesCubit, LeavesState>(builder: (context, state) {
      final cubit = BlocProvider.of<LeavesCubit>(context);
      if (state is LeavesLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (cubit.mMyLeavesBalanceData == null) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).no_data_contact_admin),
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
          body: RefreshIndicator(
            onRefresh: () async {
              _onRefresh(cubit);
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ApplyLeaveDialog(
                                cubit.mMyLeavesTypesDataList,
                                onCreateClickedCallBack:
                                    (Map<String, dynamic> data) {
                                  cubit.applyLeave(data);
                                },
                              );
                            });
                      },
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 200,
                          lineWidth: 10,
                          percent: 1,
                          animation: true,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor:
                              MColors.colorPrimarySwatch.withOpacity(.8),
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cubit.mMyLeavesBalanceData!.statisics!.remaining
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Click to apply leave",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gaps.vGap8,
                    Text(
                      "Leave Balance",
                      style: TextStyle(
                          color: MColors.colorPrimarySwatch.withOpacity(0.4),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Row(
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
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Gaps.hGap8,
                        Text(
                          cubit.mMyLeavesBalanceData!.statisics!.totalBalance!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          cubit.mMyLeavesBalanceData!.statisics!.remaining!
                              .toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Gaps.hGap8,
                      ],
                    ),
                    Gaps.vGap30,
                    StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.mMyLeavesBalanceData!.leavesType!.length,
                      crossAxisCount: 6,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                      itemBuilder: (context, index) => Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            lineWidth: 5,
                            percent: 1,
                            animation: true,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor:
                                MColors.colorPrimarySwatch.withOpacity(.8),
                            center: Text(cubit.mMyLeavesBalanceData!
                                .leavesType![index].numOfDays
                                .toString()),
                          ),
                          Text(
                            cubit.mMyLeavesBalanceData!.leavesType![index]
                                .leaveType!.name!,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                    ),
                    Gaps.vGap40,
                    Row(
                      children: [
                        Visibility(
                          visible: false,
                          child: Container(
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
                        ),
                        Spacer(),
                        Text("Leaves History",
                            style: TextStyle(
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    if (cubit.mMyLeavesHistoryDataList != null)
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: ListView.builder(
                          itemCount: cubit.mMyLeavesHistoryDataList!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cubit.mMyLeavesHistoryDataList![index]
                                            .leaveType!.name!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // Text(
                                          //   cubit
                                          //       .mMyLeavesHistoryDataList![
                                          //           index]
                                          //       .numberOfDayes
                                          //       .toString(),
                                          //   style:
                                          //       TextStyle(color: Colors.grey),
                                          // ),
                                          Text(
                                            cubit
                                                .mMyLeavesHistoryDataList![
                                                    index]
                                                .status!,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("11:44 "),
                                    ],
                                  ),
                                ],
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
    });
  }

  Future<void> _onRefresh(LeavesCubit cubit) async {
    cubit.getMyLeavesBalances();
    cubit.getMyLeavesHistory();
  }
}
