import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/salary/cubit/salary_cubit.dart';
import 'package:kafey/UI/main_screens/salary_details/salary_details_screen.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

class SalaryScreen extends StatefulWidget {
  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen>
    with TickerProviderStateMixin {
  late SalaryCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        elevation: 0,
        title: Text(
          "المرتبات",
          style: KStyles.textStyle30,
        ),
        centerTitle: true,
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
      body: BlocBuilder<SalaryCubit, SalaryState>(builder: (context, state) {
        cubit = BlocProvider.of<SalaryCubit>(context);

        if (state is SalaryLoading || cubit!.mMyLeavesHistoryDataList == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (cubit!.mMyLeavesHistoryDataList!.isEmpty) {
          return Center(
              child: Container(
            child: Text('عذراً لا توجد بيانات'),
          ));
        } else {
          Future.delayed(Duration.zero);
          return RefreshIndicator(
            onRefresh: () async {
              cubit!.getMyLeavesHistory();
            },
            child: ListView.builder(
              itemCount: cubit!.mMyLeavesHistoryDataList?.length ?? 0,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int inx) {
                return cubit!.mMyLeavesHistoryDataList != null
                    ? InkWell(
                        onTap: () {
                          Get.to(() => SalaryDetailsScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xffe5e5e5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'شهر'.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: 24,
                                      child: Center(
                                        child: Text(
                                          'يناير',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                          vertical: 6, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Color(0xff00c950),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'ايام العمل ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '21',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(4),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Color(0xffff3434),
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'الغيابات ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
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
                                              color: Color(0xff828282),
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            '172',
                                            style: TextStyle(
                                              color: Color(0xff828282),
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
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
                                            'الراتب ',
                                            style: TextStyle(
                                              color: Color(0xff828282),
                                              fontSize: 11,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6, horizontal: 12),
                                            decoration: BoxDecoration(
                                              color: Color(0xff00c950),
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                            ),
                                            child: Text(
                                              '12000',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: 'Dubai',
                                                fontWeight: FontWeight.w700,
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
                      )
                    : Container();
              },
            ),
          );
        }
      }),
    );
  }
}