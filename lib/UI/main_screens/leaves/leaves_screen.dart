import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
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
    super.build(context);
    _cardController = TabController(length: 2, vsync: this);
    List<Widget> taps = [
      Tab(
        child: Text(
          "الطلبات",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Dubai',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Tab(
        child: Text(
          "الأجازات السابقة",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Dubai',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // Tab(
      //   child: Text(
      //     "المرتبات",
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontFamily: 'Dubai',
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
    ];
    return BlocBuilder<LeavesCubit, LeavesState>(builder: (context, state) {
      final cubit = BlocProvider.of<LeavesCubit>(context);
      // void _taped(int status) async {
      //   await cubit.getMyLeavesHistory();
      //   cubit.getAllOrdersData(status: status);
      //   setState(() {});
      // }

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
            toolbarHeight: 85,
            centerTitle: true,
            elevation: 0,
            title: Text(
              "اجازاتي",
              style: KStyles.textStyle30,
            ),
            actions: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  children: [
                    SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                        height: 40, width: 50),
                    Gaps.vGap4,
                    SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_name"),
                        height: 20, width: 20),
                  ],
                ),
              ),
            ],
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.vGap30,
                    Center(
                      child: CircularPercentIndicator(
                        radius: 200,
                        lineWidth: 10,
                        percent: double.tryParse(cubit
                            .mMyLeavesBalanceData!.statisics!.precentage!
                            .toString())!,
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
                              cubit.mMyLeavesBalanceData?.leavesType,
                              onCreateClickedCallBack:
                                  (Map<String, dynamic> data) {
                                cubit.applyLeave(data);
                              },
                            ));
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return ApplyLeaveDialog(
                            //         cubit.mMyLeavesBalanceData?.leavesType,
                            //         onCreateClickedCallBack:
                            //             (Map<String, dynamic> data) {
                            //           cubit.applyLeave(data);
                            //         },
                            //       );
                            //     });
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
                            color: cubit
                                    .mMyLeavesBalanceData!
                                    .leavesType![index]
                                    .leaveType!
                                    .color!
                                    .isNotEmpty
                                ? CommonUtils.getColorFromHex(cubit
                                        .mMyLeavesBalanceData!
                                        .leavesType![index]
                                        .leaveType!
                                        .color!)
                                    .withOpacity(.2)
                                : Colors.grey.withOpacity(.2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 5,
                              percent: double.tryParse(cubit
                                  .mMyLeavesBalanceData!
                                  .leavesType![index]
                                  .leaveType!
                                  .percentage!
                                  .toString())!,
                              animation: true,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: cubit
                                      .mMyLeavesBalanceData!
                                      .leavesType![index]
                                      .leaveType!
                                      .color!
                                      .isNotEmpty
                                  ? CommonUtils.getColorFromHex(cubit
                                      .mMyLeavesBalanceData!
                                      .leavesType![index]
                                      .leaveType!
                                      .color!)
                                  : Colors.grey,
                              center: Text(cubit.mMyLeavesBalanceData!
                                  .leavesType![index].leaveType!.employeBalance
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
                                const EdgeInsets.symmetric(vertical: 2),
                            unselectedLabelColor: Colors.black87,
                            controller: _cardController,
                            tabs: List.generate(
                              taps.length,
                              (index) => taps[index],
                            ),
                          ),
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _cardController,
                        children: List.generate(2, (index) {
                          return BlocProvider(
                            create: (BuildContext context) {
                              if (index == 0) {
                                return LeavesCubit()
                                  ..getMyLeavesHistory(
                                      status: new List.from([1]));
                              } else {
                                return LeavesCubit()
                                  ..getMyLeavesHistory(
                                      status: new List.from([2, 3]));
                              }
                            },
                            child: BlocBuilder<LeavesCubit, LeavesState>(
                                builder: (context, state) {
                              var cubit = BlocProvider.of<LeavesCubit>(context);
                              if (state is LeavesLoading ||
                                  cubit.mMyLeavesHistoryDataList == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (cubit
                                  .mMyLeavesHistoryDataList!.isEmpty) {
                                return Center(
                                    child: Container(
                                  child: Text('عذراً لا توجد بيانات'),
                                ));
                              } else {
                                Future.delayed(Duration.zero);
                                return RefreshIndicator(
                                    onRefresh: () async {
                                      cubit.getMyLeavesHistory();
                                    },
                                    child: ListView.builder(
                                      itemCount: cubit.mMyLeavesHistoryDataList
                                              ?.length ??
                                          0,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int inx) {
                                        return cubit.mMyLeavesHistoryDataList !=
                                                null
                                            ? Container(
                                                child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 4,
                                                  ),
                                                  Gaps.hGap4,
                                                  Text(
                                                    " تم التقديم على أجازة ${cubit.mMyLeavesHistoryDataList![inx].leaveType?.name ?? ""} \t \t حالة الطلب",
                                                    style: KStyles.textStyle13,
                                                  ),
                                                  Spacer(),
                                                  Chip(
                                                      elevation: 2,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 4),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                        Radius.circular(4),
                                                      )),
                                                      backgroundColor: cubit
                                                                  .mMyLeavesHistoryDataList![
                                                                      inx]
                                                                  .status! ==
                                                              1
                                                          ? Colors.grey
                                                              .withOpacity(0.3)
                                                          : cubit
                                                                      .mMyLeavesHistoryDataList![
                                                                          inx]
                                                                      .status! ==
                                                                  3
                                                              ? Colors.red
                                                                  .withOpacity(
                                                                      0.3)
                                                              : Colors.green
                                                                  .withOpacity(
                                                                      0.3),
                                                      label: Container(
                                                        width: 60,
                                                        child: Center(
                                                          child: Text(
                                                            cubit
                                                                        .mMyLeavesHistoryDataList![
                                                                            inx]
                                                                        .status! ==
                                                                    1
                                                                ? 'مُعلق'
                                                                : cubit.mMyLeavesHistoryDataList![inx]
                                                                            .status! ==
                                                                        3
                                                                    ? 'مرفوض'
                                                                    : 'مقبول',
                                                            style: TextStyle(
                                                              color: cubit
                                                                          .mMyLeavesHistoryDataList![
                                                                              inx]
                                                                          .status! ==
                                                                      1
                                                                  ? Colors.grey
                                                                  : cubit.mMyLeavesHistoryDataList![inx].status! ==
                                                                          3
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .green,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ))
                                            : Container();
                                      },
                                    ));
                              }
                            }),
                          );
                        }),
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
