import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

import 'cubit/salary_details_cubit.dart';

class SalaryDetailsScreen extends StatefulWidget {
  SalaryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SalaryDetailsScreen> createState() => _SalaryDetailsScreenState();
}

class _SalaryDetailsScreenState extends State<SalaryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 85,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "الرواتب",
          style: KStyles.textStyle30,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: [
                Gaps.vGap8,
                SvgPicture.asset(ImageUtils.getSVGPath("ic_kafey_logo"),
                    height: 35, width: 40),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<SalaryDetailsCubit, SalaryDetailsState>(
          builder: (context, state) {
        final cubit = BlocProvider.of<SalaryDetailsCubit>(context);
        if (state is SalaryDetailsLoading) {
          return Container(
            padding: EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                // cubit!.getHomeStatistics();
                // cubit!.updateCurrentLocation();
              },
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 222,
                        margin: EdgeInsets.only(
                          left: 37,
                          right: 37,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'المرتب الأساسي',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '12000 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الساعات الاضافية',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10 ساعات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الحوافز',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00c950),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '500',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'البدلات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00c950),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '300',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              tileMode: TileMode.mirror,
                              colors: [
                                Color(0xff0eedff),
                                Color(0xffab74f9),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'الاستحقاقات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap50,
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(
                          left: 37,
                          right: 37,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'التأمينات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '666 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الضرائب',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '120 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الخصومات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff3434),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '222',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                                  Color(0xff0eedff),
                                  Color(0xffab74f9),
                                ],
                              )),
                          child: Center(
                            child: Text(
                              'الاستقطاعات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap16,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          'اجمالي المرتب',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              tileMode: TileMode.mirror,
                              colors: [
                                Color(0xff0eedff),
                                Color(0xffab74f9),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '12588 جنيه',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (cubit.mNotificationDataList == null ||
            cubit.mNotificationDataList!.isEmpty) {
          return Center(
            child: Container(
              child: Text('عذراً لا توجد بيانات'),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                // cubit!.getHomeStatistics();
                // cubit!.updateCurrentLocation();
              },
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 222,
                        margin: EdgeInsets.only(
                          left: 37,
                          right: 37,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'المرتب الأساسي',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '12000 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الساعات الاضافية',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10 ساعات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الحوافز',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00c950),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '500',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'البدلات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff00c950),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '300',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              tileMode: TileMode.mirror,
                              colors: [
                                Color(0xff0eedff),
                                Color(0xffab74f9),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'الاستحقاقات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap50,
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(
                          left: 37,
                          right: 37,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'التأمينات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '666 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الضرائب',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '120 جنيه',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.vGap8,
                              Row(
                                children: [
                                  Text(
                                    'الخصومات',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff3434),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '222',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Dubai',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                                  Color(0xff0eedff),
                                  Color(0xffab74f9),
                                ],
                              )),
                          child: Center(
                            child: Text(
                              'الاستقطاعات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap16,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          'اجمالي المرتب',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            left: 37,
                            right: 37,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              tileMode: TileMode.mirror,
                              colors: [
                                Color(0xff0eedff),
                                Color(0xffab74f9),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '12588 جنيه',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Dubai',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
