import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/salary/cubit/salary_cubit.dart';
import 'package:kafey/UI/main_screens/salary_details/salary_details_screen.dart';
import 'package:kafey/UI/widgets/empty_data_widget.dart';
import 'package:kafey/UI/widgets/loading_widget.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

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
          S.of(context).salaries,
          style: KStyles.textStyle30,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
      body: BlocBuilder<SalaryCubit, SalaryState>(builder: (context, state) {
        cubit = BlocProvider.of<SalaryCubit>(context);

        if (state is SalaryLoading ||
            cubit!.mMySalariesHistoryDataList == null) {
          return const LoadingWidget();
        } else if (cubit!.mMySalariesHistoryDataList!.isEmpty) {
          return EmptyDataWidget(
            onRefreshClicked: () {
              cubit!.getMySalariesHistory();
            },
          );
        } else {
          Future.delayed(Duration.zero);
          return RefreshIndicator(
            onRefresh: () async {
              cubit!.getMySalariesHistory();
            },
            child: ListView.builder(
              itemCount: cubit!.mMySalariesHistoryDataList?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return cubit!.mMySalariesHistoryDataList != null
                    ? InkWell(
                        onTap: () {
                          Get.to(() => SalaryDetailsScreen(
                              cubit!.mMySalariesHistoryDataList![index].id!));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
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
                                  color: const Color(0xffe5e5e5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).month,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Center(
                                      child: Text(
                                        cubit!
                                            .mMySalariesHistoryDataList![index]
                                            .month!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(4),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff00c950),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          S.of(context).Working_days,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Dubai',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Text(
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
                                    margin: const EdgeInsets.all(4),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffff3434),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          S.of(context).absences,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Dubai',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const Text(
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
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(4),
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        Text(
                                          S.of(context).salary,
                                          style: const TextStyle(
                                            color: Color(0xff828282),
                                            fontSize: 11,
                                            fontFamily: 'Dubai',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff00c950),
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                          child: Text(
                                            cubit!
                                                .mMySalariesHistoryDataList![
                                                    index]
                                                .value!
                                                .toString(),
                                            style: const TextStyle(
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
