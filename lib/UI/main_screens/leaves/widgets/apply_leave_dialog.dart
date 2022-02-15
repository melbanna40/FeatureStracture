import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_balance_response.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:kafey/res/styles.dart';

class ApplyLeaveDialog extends StatefulWidget {
  final List<LeavesType>? mLeavesTypeList;
  final Function(Map<String, dynamic>)? onCreateClickedCallBack;

  const ApplyLeaveDialog(this.mLeavesTypeList,
      {Key? key, this.onCreateClickedCallBack})
      : super(key: key);

  @override
  _ApplyLeaveDialogState createState() => _ApplyLeaveDialogState();
}

class _ApplyLeaveDialogState extends State<ApplyLeaveDialog> {
  final _dateController = TextEditingController();
  final _reasonController = TextEditingController();
  String? start;
  String? end;
  LeavesType? selectedLeaveType;

  @override
  void initState() {
    selectedLeaveType = widget.mLeavesTypeList![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "طلب أجازة",
          style: TextStyle(color: MColors.colorPrimarySwatch, fontSize: 26),
        ),
        leading: const BackButton(
          color: MColors.colorPrimarySwatch,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("اختار تاريخ الأجازة", style: KStyles.textStyle16),
              InkWell(
                onTap: () async {
                  final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            appBarTheme: const AppBarTheme(
                                foregroundColor: MColors.colorPrimarySwatch,
                                backgroundColor: MColors.colorPrimarySwatch),
                            //Header background color
                            primaryColor: MColors.colorPrimarySwatch,
                            //Background color
                            scaffoldBackgroundColor: Colors.grey[50],
                            //Divider color
                            dividerColor: Colors.grey,
                            //Non selected days of the month color
                            textTheme: const TextTheme(
                              bodyText2: TextStyle(color: Colors.black),
                            ),
                            colorScheme: ColorScheme.fromSwatch().copyWith(
                              //Selected dates background color
                              primary: MColors.colorPrimarySwatch,
                              //Month title and week days color
                              onSurface: MColors.colorPrimarySwatch,
                              //Header elements and selected dates text color
                              //onPrimary: Colors.white,
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (picked != null) {
                    // print(picked);
                    start = DateFormat('yyyy-MM-dd', 'en').format(picked.start);
                    end = DateFormat('yyyy-MM-dd', 'en').format(picked.end);

                    _dateController.text =
                        "   من   " + start! + "  إلى    " + end!;
                    setState(() {});
                  }
                },
                child: TextFormField(
                  controller: _dateController,
                  enabled: false,
                  style: KStyles.textStyle16,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MColors.colorPrimarySwatch, width: 1.0),
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.calendar,
                        color: MColors.colorPrimarySwatch,
                      )),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height*0.3,
              //   child: DateRangePickerDialog(firstDate: DateTime.now(),
              //     lastDate: DateTime(2030),),
              // ),
              Gaps.vGap15,
              const Text("اختار نوع الأجازة", style: KStyles.textStyle16),
              DropdownButtonHideUnderline(
                child: DropdownButton<LeavesType>(
                  isExpanded: true,
                  icon: Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          // color: MColors.colorPrimary,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        CupertinoIcons.chevron_up_chevron_down,
                        color: MColors.colorPrimarySwatch,
                      )),
                  items: widget.mLeavesTypeList!
                      .map((LeavesType item) => DropdownMenuItem<LeavesType>(
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 4,
                                    backgroundColor:
                                        item.leaveType!.color!.isNotEmpty
                                            ? CommonUtils.getColorFromHex(
                                                item.leaveType!.color!)
                                            : Colors.grey,
                                  ),
                                  Gaps.hGap4,
                                  Text(
                                    item.leaveType!.name!,
                                    style: TextStyle(
                                      color: item.leaveType!.color!.isNotEmpty
                                          ? CommonUtils.getColorFromHex(
                                              item.leaveType!.color!)
                                          : Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Dubai',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${item.leaveType?.employeBalance.toString()} يوم متبقي',
                                    style: const TextStyle(
                                      color: Color(0xff828282),
                                      fontSize: 11,
                                      fontFamily: 'Dubai',
                                    ),
                                  ),
                                ],
                              )),
                          value: item))
                      .toList(),
                  onChanged: (LeavesType? val) {
                    setState(() {
                      selectedLeaveType = val!;
                    });
                  },
                  value: selectedLeaveType,
                ),
              ),
              Gaps.vGap15,
              const Text("السبب", style: KStyles.textStyle16),
              SizedBox(
                height: 200,
                child: TextFormField(
                  maxLines: 5,
                  controller: _reasonController,
                ),
              ),
              Gaps.vGap15,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: MColors.colorPrimarySwatch,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8), right: Radius.circular(8))),
                child: MaterialButton(
                    child: Text(
                      S.of(context).submit,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (start == null || end == null) {
                        CommonUtils.showToastMessage(
                            'من فضلك قم باختيار فترة الطلب');
                      } else {
                        widget.onCreateClickedCallBack!.call({
                          'from': start,
                          'to': end,
                          'reason': _reasonController.text,
                          'leave_type_id': selectedLeaveType!.leaveType!.id!
                        });
                        Navigator.pop(context);
                      }

                      // Log.e(selectedLeaveType!.id.toString());
                      // Log.e(start);
                      // Log.e(end);
                      // Log.e(_reasonController.text);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
