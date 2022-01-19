import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kafey/UI/main_screens/leaves/cubit/leaves_cubit.dart';
import 'package:kafey/UI/main_screens/leaves/widgets/apply_leave_dialog.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:kafey/res/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({Key? key}) : super(key: key);

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

TabController? _cardController;

class _LeavesScreenState extends State<LeavesScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    _cardController = TabController(length: 3, vsync: this);
    List<Widget> taps = [
      Tab(
        text: "الطلبات"
      ),
      Tab(
        text: "الأجازات السابقة",
      ),
      Tab(
        text: S.of(context).pending,
      ),
    ];
    return BlocBuilder<LeavesCubit, LeavesState>(builder: (context, state) {
      final cubit = BlocProvider.of<LeavesCubit>(context);
      void _taped(int status) {
        // cubit.getAllOrdersData(status: status);
        setState(() {});
      }

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "اجازاتي",
              style: KStyles.textStyle30,
            ),
          ),
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

                    Gaps.vGap30,
                    InkWell(
                      onTap: () {
                        Get.to(ApplyLeaveDialog(
                          cubit.mMyLeavesTypesDataList,
                          onCreateClickedCallBack: (Map<String, dynamic> data) {
                            cubit.applyLeave(data);
                          },
                        ));
                        // showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return ApplyLeaveDialog(
                        //         cubit.mMyLeavesTypesDataList,
                        //         onCreateClickedCallBack:
                        //             (Map<String, dynamic> data) {
                        //           cubit.applyLeave(data);
                        //         },
                        //       );
                        //     });
                      },
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 200,
                          lineWidth: 10,
                          percent: .75,
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
                                    color: MColors.colorPrimarySwatch,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "رصيد الأجازات",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gaps.vGap8,
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: MColors.colorPrimarySwatch,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(8),
                              right: Radius.circular(8))),
                      child: MaterialButton(
                          child: Text(
                            "اضغط لطلب اجازة",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Get.to(ApplyLeaveDialog(
                              cubit.mMyLeavesTypesDataList,
                              onCreateClickedCallBack: (Map<String, dynamic> data) {
                                cubit.applyLeave(data);
                              },
                            ));
                          }),
                    ),
                    Gaps.vGap30,
                    StaggeredGridView.countBuilder(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cubit.mMyLeavesBalanceData!.leavesType!.length,
                      crossAxisCount: 6,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 12,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: index == 0
                                ? MColors.colorPrimarySwatch.withOpacity(.2)
                                : index == 1
                                    ? Colors.green.withOpacity(.2)
                                    : index == 2
                                        ? Colors.grey.withOpacity(.18)
                                        : index == 3
                                            ? Colors.pink.withOpacity(.2)
                                            : Colors.yellow.withOpacity(.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 5,
                              percent: .75,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: index == 0
                                  ? MColors.colorPrimarySwatch
                                  : index == 1
                                      ? Colors.green
                                      : index == 2
                                          ? Colors.grey
                                          : index == 3
                                              ? Colors.pink
                                              : Colors.yellow,
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
                      ),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                    ),
                    Gaps.vGap40,
                    Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            // color: MColors.colorPrimarySwatch.withOpacity(.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: TabBar(
                            isScrollable: true,
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            // onTap: _taped,
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.tab,
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            indicator: BoxDecoration(
                                color: MColors.colorPrimarySwatch,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),

                            // UnderlineTabIndicator(
                            //
                            //     borderSide:
                            //         BorderSide(color: Colors.white, width: 30)),
                            labelColor: Colors.white,
                            indicatorPadding:
                                const EdgeInsets.symmetric(vertical: 4),
                            unselectedLabelColor: Colors.black87,
                            controller: _cardController,
                            tabs: List.generate(
                              taps.length,
                              (index) => taps[index],
                            ),
                          ),
                        )),
                    Container(
                      height: 200,
                      //Add this to give height

                      child: TabBarView(
                        controller: _cardController,
                        children: List.generate(3, (index) {
                          return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int inx) {
                              return Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4,
                                    ),
                                    Gaps.hGap4,
                                    Container(
                                      width: 220,
                                      child: Text(
                                        "تم التقديم على اجازة مرضية يوم 16 يناير",
                                        style: KStyles.textStyle13,
                                      ),
                                    ),
                                    Chip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        )),
                                        backgroundColor:
                                            Colors.greenAccent.withOpacity(.3),
                                        label: Text(
                                          "تحت الطلب",
                                          style: TextStyle(color: Colors.green),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
