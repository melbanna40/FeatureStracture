import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/main_screens/attendance/cubit/attendance_cubit.dart';
import 'package:kafey/UI/widgets/loading_widget.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/styles.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
            S.of(context).attendance,
            style: KStyles.textStyle30,
          ),
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
        body: BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
          final cubit = BlocProvider.of<AttendanceCubit>(context);
          if (state is AttendanceLoading ||
              cubit.mAttendanceHistoryDataList == null) {
            return const LoadingWidget();
          } else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      DateTime initialDate = DateTime.now();

                      final DateTime? selected = await showMonthPicker(
                        context: context,
                        firstDate: DateTime(initialDate.year - 1, 5),
                        lastDate: DateTime(initialDate.year + 1, 9),
                        initialDate: initialDate,
                      );
                      if (selected != null) {
                        cubit.updateAttendanceDate(selected);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff0995f5),
                        ),
                        Text(
                          DateFormat.yMMMM('ar').format(cubit.attendanceDay!),
                          style: const TextStyle(
                            color: Color(0xff0995f5),
                            fontSize: 20,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff0995f5),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await cubit.getAttendanceHistoryApiCal();
                      },
                      child: cubit.mAttendanceHistoryDataList != null &&
                              cubit.mAttendanceHistoryDataList!.isNotEmpty
                          ? ListView.builder(
                              itemCount:
                                  cubit.mAttendanceHistoryDataList!.length,
                              itemBuilder: (context, index) => Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  color: (cubit
                                          .mAttendanceHistoryDataList![index]
                                          .isHoliday!)
                                      ? const Color(0xfffffdf6)
                                      : (cubit
                                                      .mAttendanceHistoryDataList![
                                                          index]
                                                      .status !=
                                                  null &&
                                              cubit
                                                      .mAttendanceHistoryDataList![
                                                          index]
                                                      .status ==
                                                  4)
                                          ? const Color(0xfff6fbff)
                                          : null,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: (cubit
                                                .mAttendanceHistoryDataList![
                                                    index]
                                                .isHoliday!)
                                            ? const Color(0xffffaa00)
                                            : const Color(0xffe5e5e5),
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: (!cubit
                                                    .mAttendanceHistoryDataList![
                                                        index]
                                                    .isHoliday! &&
                                                (cubit
                                                            .mAttendanceHistoryDataList![
                                                                index]
                                                            .status !=
                                                        null &&
                                                    cubit
                                                            .mAttendanceHistoryDataList![
                                                                index]
                                                            .status !=
                                                        4))
                                            ? const LinearGradient(
                                                colors: [
                                                  Color(0xff0eedff),
                                                  Color(0xffab74f9),
                                                ],
                                              )
                                            : null,
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
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Center(
                                              child: Text(
                                                cubit
                                                    .mAttendanceHistoryDataList![
                                                        index]
                                                    .dayOfWeek!,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (cubit.mAttendanceHistoryDataList![index]
                                        .isHoliday!)
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            S.of(context).weekend,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontFamily: 'Dubai',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!cubit
                                        .mAttendanceHistoryDataList![index]
                                        .isHoliday!)
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          width: 110,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6,
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  color: (cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .status !=
                                                              null &&
                                                          cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .status! ==
                                                              4)
                                                      ? const Color(0xffdcdcdc)
                                                      : const Color(0xff00c950),
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      S.of(context).attend,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontFamily: 'Dubai',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      cubit
                                                                      .mAttendanceHistoryDataList![
                                                                          index]
                                                                      .clockIn !=
                                                                  null &&
                                                              cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .clockIn!
                                                                  .isNotEmpty
                                                          ? cubit
                                                              .mAttendanceHistoryDataList![
                                                                  index]
                                                              .clockIn!
                                                          : '00:00',
                                                      style: const TextStyle(
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
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 4),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6,
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  color: (cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .status !=
                                                              null &&
                                                          cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .status! ==
                                                              4)
                                                      ? const Color(0xffdcdcdc)
                                                      : const Color(0xffff3434),
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      S.of(context).leave,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily: 'Dubai',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      cubit
                                                                      .mAttendanceHistoryDataList![
                                                                          index]
                                                                      .clockOut !=
                                                                  null &&
                                                              cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .clockOut!
                                                                  .isNotEmpty
                                                          ? cubit
                                                              .mAttendanceHistoryDataList![
                                                                  index]
                                                              .clockOut!
                                                          : '00:00',
                                                      style: const TextStyle(
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
                                      ),
                                    if (!cubit
                                        .mAttendanceHistoryDataList![index]
                                        .isHoliday!)
                                      Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(4),
                                            padding: const EdgeInsets.all(4),
                                            height: 25,
                                            child: Row(
                                              children: [
                                                Text(
                                                  S.of(context).working_hours,
                                                  style: const TextStyle(
                                                    color: Color(0xff828282),
                                                    fontSize: 11,
                                                    fontFamily: 'Dubai',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  cubit
                                                                  .mAttendanceHistoryDataList![
                                                                      index]
                                                                  .hoursPerDay !=
                                                              null &&
                                                          cubit
                                                              .mAttendanceHistoryDataList![
                                                                  index]
                                                              .hoursPerDay!
                                                              .isNotEmpty
                                                      ? cubit
                                                          .mAttendanceHistoryDataList![
                                                              index]
                                                          .hoursPerDay!
                                                      : '00:00',
                                                  style: const TextStyle(
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
                                            margin: const EdgeInsets.all(4),
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: [
                                                Text(
                                                  S.of(context).state,
                                                  style: const TextStyle(
                                                    color: Color(0xff828282),
                                                    fontSize: 11,
                                                    fontFamily: 'Dubai',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 6,
                                                      horizontal: 12),
                                                  decoration: BoxDecoration(
                                                    color: (cubit
                                                                    .mAttendanceHistoryDataList![
                                                                        index]
                                                                    .status !=
                                                                null &&
                                                            cubit
                                                                    .mAttendanceHistoryDataList![
                                                                        index]
                                                                    .status ==
                                                                4)
                                                        ? const Color(
                                                            0xffdcdcdc)
                                                        : const Color(
                                                            0xff00c950),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: Text(
                                                    (cubit
                                                                    .mAttendanceHistoryDataList![
                                                                        index]
                                                                    .status !=
                                                                null &&
                                                            cubit
                                                                    .mAttendanceHistoryDataList![
                                                                        index]
                                                                    .status ==
                                                                4)
                                                        ? S.of(context).absent
                                                        : S
                                                            .of(context)
                                                            .attendant,
                                                    style: const TextStyle(
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
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: Text(S.of(context).empty_data),
                            ),
                    ),
                  )
                ],
              ),
            );
          }
        }));
  }
}
